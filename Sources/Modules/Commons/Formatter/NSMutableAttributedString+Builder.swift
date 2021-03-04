import UIKit

extension NSMutableAttributedString {
    @discardableResult
    func apply(font: UIFont, in text: String? = nil) -> NSMutableAttributedString {
        let range = (string as NSString).range(of: text ?? string)
        addAttribute(.font, value: font, range: range)

        return self
    }
}
