import UIKit

extension NSMutableAttributedString {
    @discardableResult
    func apply(font: UIFont, in text: String? = nil) -> NSMutableAttributedString {
        let range = string.range(of: text)
        addAttribute(.font, value: font, range: range)

        return self
    }
}
