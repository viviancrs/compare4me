import Foundation

extension Numeric {
    func percent(locale: LocaleIdentifier) -> String? {
        guard let number = self as? NSNumber else {
            return nil
        }

        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: locale.rawValue)
        formatter.numberStyle = .percent
        return formatter.string(from: number)
    }
}
