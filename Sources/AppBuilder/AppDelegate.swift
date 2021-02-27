import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let viewController = CompareDollarInputViewController()

        window = UIWindow()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}