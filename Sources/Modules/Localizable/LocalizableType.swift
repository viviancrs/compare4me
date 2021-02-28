import Foundation

protocol LocalizableType {
    var rawValue: String { get }
    var table: String? { get }
    var localized: String { get }
}

extension LocalizableType {
    var localized: String {
        return Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
    }

    var table: String? {
        return nil
    }
}
