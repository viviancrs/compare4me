import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        let appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()

        self.appCoordinator = appCoordinator
        self.window = window
        return true
    }
}
