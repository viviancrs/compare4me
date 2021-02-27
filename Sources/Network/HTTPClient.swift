import Foundation

protocol HTTPClientType {
    func request<T: Decodable, R: RouterType>(router: R, completion: @escaping (Result<T, NetworkError>) -> Void)
}

struct HTTPClient: HTTPClientType {

    private let session: URLSession

    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    func request<T: Decodable, R: RouterType>(router: R, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters

        guard let url = components.url else {
            completion(.failure(.badRequest))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method.rawValue

        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        dataTask.resume()
    }

    private func handleResponse<T: Decodable>(data: Data?,
                                              response: URLResponse?,
                                              error: Error?,
                                              completion: (Result<T, NetworkError>) -> Void) {
        if error != nil {
            completion(.failure(.general))
            return
        }

        guard let data = data else {
            completion(.failure(.general))
            return
        }

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completion(.failure(.general))
            return
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        guard let responseObject = try? decoder.decode(T.self, from: data) else {
            completion(.failure(.general))
            return
        }

        completion(.success(responseObject))
    }
}
