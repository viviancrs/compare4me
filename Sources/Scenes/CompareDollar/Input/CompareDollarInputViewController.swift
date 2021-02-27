import UIKit

protocol CompareDollarInputViewControllerType: AnyObject {
    func show(viewModel: CompareDollarInputViewModel)
}

class CompareDollarInputViewController: UIViewController {
    private var presenter: CompareDollarInputPresenterType
    private let mainView: CompareDollarInputViewType

    init(presenter: CompareDollarInputPresenterType = CompareDollarInputPresenter(),
         view: CompareDollarInputViewType = CompareDollarInputView()) {
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
    }
}

extension CompareDollarInputViewController: CompareDollarInputViewControllerType {
    func show(viewModel: CompareDollarInputViewModel) {
        DispatchQueue.main.async {
            self.mainView.show(viewModel: viewModel)
        }
    }
}
