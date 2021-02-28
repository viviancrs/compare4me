import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        let childCoordinator = CompareUSDCoordinator(navigationController: navigationController)
        childCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
