import UIKit

extension UINavigationController {
    func setTransparentStyle() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = Colors.Surface.onBackground
        navigationBar.topItem?.title = ""
    }
}
