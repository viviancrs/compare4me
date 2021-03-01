import UIKit

protocol CompareUSDInputViewControllerDelegate: AnyObject {
    func showResult(from data: CompareUSD)
}

protocol CompareUSDInputViewControllerType: AnyObject {
    func show(viewModel: CompareUSDInputViewModel)
    func showError(_ error: String)
    func showResult(from data: CompareUSD)
}

class CompareUSDInputViewController: UIViewController {
    weak var delegate: CompareUSDInputViewControllerDelegate?

    private var presenter: CompareUSDInputPresenterType
    private let mainView: CompareUSDInputViewType

    init(presenter: CompareUSDInputPresenterType = CompareUSDInputPresenter(),
         view: CompareUSDInputViewType = CompareUSDInputView()) {
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
        bindEvents()
    }

    private func bindEvents() {
        mainView.didTapCompareBlock = { [weak self] usdValue, brlValue in
            self?.presenter.compare(usdValue: usdValue, brlValue: brlValue)
        }
    }
}

extension CompareUSDInputViewController: CompareUSDInputViewControllerType {
    func showError(_ error: String) {
        print(error) // TODO - mostrar mensagem de erro
    }

    func showResult(from data: CompareUSD) {
        DispatchQueue.main.async {
            self.delegate?.showResult(from: data)
        }
    }

    func show(viewModel: CompareUSDInputViewModel) {
        DispatchQueue.main.async {
            self.mainView.show(viewModel: viewModel)
        }
    }
}
