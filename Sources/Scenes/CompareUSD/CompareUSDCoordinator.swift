import UIKit

class CompareUSDCoordinator: Coordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = createInputViewController()

        navigationController?.setTransparentStyle()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func createInputViewController() -> CompareUSDInputViewController {
        let vc = CompareUSDInputViewController()
        vc.delegate = self
        return vc
    }

    private func createResultViewController(data: CompareUSD) -> CompareUSDResultViewController {
        let presenter = CompareUSDResultPresenter(data: data)
        let vc = CompareUSDResultViewController(presenter: presenter)
        return vc
    }
}

extension CompareUSDCoordinator: CompareUSDInputViewControllerDelegate {
    func showResult(from data: CompareUSD) {
        let vc = createResultViewController(data: data)

        navigationController?.setTransparentStyle()
        navigationController?.pushViewController(vc, animated: true)
    }
}
