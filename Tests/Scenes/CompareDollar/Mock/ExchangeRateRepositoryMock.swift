@testable import Compare4Me

class ExchangeRateRepositoryMock: ExchangeRateRepositoryType {
    @Spy var invokedFetch: Bool?
    var mockResult: Result<ExchangeRate, NetworkError>?

    func fetch(completion: @escaping (Result<ExchangeRate, NetworkError>) -> Void) {
        invokedFetch = true
        if let result = mockResult {
            completion(result)
        }
    }
}
