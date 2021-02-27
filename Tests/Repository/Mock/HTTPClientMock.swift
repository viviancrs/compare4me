@testable import Compare4Me

class HTTPClientMock<Router: RouterType>: HTTPClientType {

    @Spy var invokedRequest: Router?

    var mockModel: Decodable?
    var mockError: NetworkError?

    func request<T: Decodable, R: RouterType>(router: R, completion: @escaping (Result<T, NetworkError>) -> Void) {
        invokedRequest = router as? Router

        if let model = mockModel as? T {
            completion(.success(model))
        }

        if let error = mockError {
            completion(.failure(error))
        }
    }
}
