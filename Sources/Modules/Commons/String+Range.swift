import UIKit

extension String {
    func range(of text: String?) -> NSRange {
        (self as NSString).range(of: text ?? self)
    }
}
