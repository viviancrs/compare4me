import Foundation

enum Route: RouterType {
    case exchangeRate(fromSymbol: ExchangeRate.Symbol, toSymbol: ExchangeRate.Symbol)

    var scheme: String {
        return "https"
    }

    var host: String {
        return API.economia.value ?? ""
    }

    var path: String {
        switch self {
        case .exchangeRate(let fromSymbol, let toSymbol):
            return "/json/all/\(fromSymbol.rawValue)-\(toSymbol.rawValue)"
        }
    }

    var parameters: [URLQueryItem] {
        return []
    }

    var method: HTTPMethod {
        return .get
    }
}
