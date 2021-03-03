import Foundation

extension Numeric {
    func currency(locale: LocaleIdentifier) -> String? {
        guard let number = self as? NSNumber else {
            return nil
        }

        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: locale.rawValue)
        formatter.numberStyle = .currency
        return formatter.string(from: number)
    }
}
