import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?

    private let window: UIWindow
    private var currentCoordinator: Coordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()

        let childCoordinator = CompareUSDCoordinator(navigationController: navigationController)
        childCoordinator.start()

        self.navigationController = navigationController
        self.currentCoordinator = childCoordinator

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
