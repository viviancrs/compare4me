@testable import Compare4Me

class HTTPClientMock<Route: RouterType>: HTTPClientType {

    @Spy var invokedRequest: Route?

    var mockModel: Decodable?
    var mockError: NetworkError?

    func request<T: Decodable, R: RouterType>(route: R, completion: @escaping (Result<T, NetworkError>) -> Void) {
        invokedRequest = route as? Route

        if let model = mockModel as? T {
            completion(.success(model))
        }

        if let error = mockError {
            completion(.failure(error))
        }
    }
}
