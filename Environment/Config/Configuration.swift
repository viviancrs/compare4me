import Foundation

protocol ConfigurationType {
    var rawValue: String { get }
    var value: String? { get }
}

extension ConfigurationType {
    var value: String? {
        let object = Bundle.main.object(forInfoDictionaryKey: rawValue)
        return object as? String
    }
}

enum API: String, ConfigurationType {
    case economia = "API_ECONOMIA_URL"
}
