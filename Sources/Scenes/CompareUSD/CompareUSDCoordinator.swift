import UIKit

class CompareUSDCoordinator: Coordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = createInputViewController()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.pushViewController(vc, animated: true)
    }

    private func createInputViewController() -> CompareUSDInputViewController {
        let vc = CompareUSDInputViewController()
        return vc
    }
}
