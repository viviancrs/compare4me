protocol CompareDollarInputPresenterType {
    var viewController: CompareDollarInputViewControllerType? { get set }
    func compare(dollarValue: Double, realValue: Double)
}

class CompareDollarInputPresenter {
    weak var viewController: CompareDollarInputViewControllerType?

    private var viewModel: CompareDollarInputViewModel {
        didSet {
            viewController?.show(viewModel: viewModel)
        }
    }

    init() {
        self.viewModel = CompareDollarInputViewModel(dollarValue: 0, realValue: 0)
    }
}

extension CompareDollarInputPresenter: CompareDollarInputPresenterType {
    func compare(dollarValue: Double, realValue: Double) {
    }
}
