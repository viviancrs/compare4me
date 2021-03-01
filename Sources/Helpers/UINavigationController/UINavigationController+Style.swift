import UIKit

extension UINavigationController {
    func setTransparentStyle() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = Colors.Neutrals.neutral90
        navigationBar.topItem?.title = ""
    }
}
