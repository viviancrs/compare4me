import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow
    private var currentCoordinator: Coordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()

        let childCoordinator = CompareUSDCoordinator(navigationController: navigationController)
        childCoordinator.start()
        self.currentCoordinator = childCoordinator

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
