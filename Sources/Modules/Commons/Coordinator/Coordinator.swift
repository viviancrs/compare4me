import UIKit

enum NavigationType {
    case push
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func start()
}

extension Coordinator {
    func show(_ vc: UIViewController, with navigationType: NavigationType, animated: Bool) {
        switch navigationType {
        case .push:
            navigationController?.pushViewController(vc, animated: animated)
        }
    }
}
