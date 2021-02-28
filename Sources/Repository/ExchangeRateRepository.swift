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
//        client.request(route: route) { (result: Result<[String: ExchangeRate], NetworkError>) in
//            switch result {
//            case .success(let dict):
//                guard let value = dict[ExchangeRate.Symbol.usdt.rawValue] else {
//                    completion(.failure(.general))
//                    return
//                }
//                completion(.success(value))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
}
