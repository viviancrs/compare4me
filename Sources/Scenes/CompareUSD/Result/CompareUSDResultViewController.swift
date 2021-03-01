import UIKit

protocol CompareUSDResultViewControllerType: AnyObject {
    func show(viewModel: CompareUSDResultViewModel)
}

class CompareUSDResultViewController: UIViewController {
    private var presenter: CompareUSDResultPresenterType
    private let mainView: CompareUSDResultViewType

    init(presenter: CompareUSDResultPresenterType,
         view: CompareUSDResultViewType = CompareUSDResultView()) {
        self.mainView = view
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)

        self.presenter.viewController = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension CompareUSDResultViewController: CompareUSDResultViewControllerType {
    func show(viewModel: CompareUSDResultViewModel) {
        mainView.show(viewModel: viewModel)
    }
}
