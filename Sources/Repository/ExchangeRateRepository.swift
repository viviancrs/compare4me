import Foundation

protocol ExchangeRateRepositoryType {
    func fetch(completion: @escaping (Result<ExchangeRate, NetworkError>) -> Void)
}

struct ExchangeRateRepository: ExchangeRateRepositoryType {
    let client: HTTPClientType

    init(client: HTTPClientType = HTTPClient()) {
        self.client = client
    }

    func fetch(completion: @escaping (Result<ExchangeRate, NetworkError>) -> Void) {
        let route = Route.exchangeRate(fromSymbol: .usdt, toSymbol: .brl)
        client.request(route: route, completion: completion)
    }
}
