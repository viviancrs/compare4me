import Foundation
@testable import Compare4Me

enum MockRouter: RouterType {
    case invalid
    case valid

    var scheme: String {
        return "http"
    }

    var host: String {
        switch self {
        case .valid: return "www.google.com.br"
        case .invalid: return "error"
        }
    }

    var path: String {
        switch self {
        case .valid: return "/path"
        case .invalid: return "error"
        }
    }

    var parameters: [URLQueryItem] {
        return [
            URLQueryItem(name: "name1", value: "value1"),
            URLQueryItem(name: "name2", value: "value2")
        ]
    }

    var method: HTTPMethod {
        return .get
    }
}
