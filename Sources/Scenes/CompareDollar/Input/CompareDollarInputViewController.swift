import UIKit

protocol CompareDollarInputViewControllerType: AnyObject {
    func show(viewModel: CompareDollarInputViewModel)
    func showError(_ error: String)
    func showResult(from data: CompareDollar)
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
}

extension CompareDollarInputViewController: CompareDollarInputViewControllerType {
    func showError(_ error: String) {
        print(error) // TODO - mostrar mensagem de erro
    }

    func showResult(from data: CompareDollar) {
        print(data) // TODO - navegar para a próxima tela
    }

    func show(viewModel: CompareDollarInputViewModel) {
        DispatchQueue.main.async {
            self.mainView.show(viewModel: viewModel)
        }
    }
}
