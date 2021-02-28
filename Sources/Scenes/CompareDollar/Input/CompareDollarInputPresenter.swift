protocol CompareDollarInputPresenterType {
    var viewController: CompareDollarInputViewControllerType? { get set }
    func compare(dollarValue: Double, realValue: Double)
}

class CompareDollarInputPresenter {
    weak var viewController: CompareDollarInputViewControllerType?
    private let repository: ExchangeRateRepositoryType

    private var viewModel: CompareDollarInputViewModel {
        didSet {
            viewController?.show(viewModel: viewModel)
        }
    }

    init(repository: ExchangeRateRepositoryType = ExchangeRateRepository()) {
        self.repository = repository
        self.viewModel = CompareDollarInputViewModel()
    }

    private func handleFetch(dollarValue: Double, realValue: Double, result: Result<ExchangeRate, NetworkError>) {
        self.viewModel = viewModel.with(isButtonLoading: false)

        switch result {
        case .success(let exchangeRate):
            let dollarPrice = Double(exchangeRate.bid) ?? 0
            let data = CompareDollar(totalInDollar: dollarValue,
                                     totalInReal: realValue,
                                     dollarPrice: dollarPrice)
            viewController?.showResult(from: data)
        case .failure:
            viewController?.showError("Erro ao obter cotação") // TODO - substituir por API de localização
        }
    }
}

extension CompareDollarInputPresenter: CompareDollarInputPresenterType {
    func compare(dollarValue: Double, realValue: Double) {
        self.viewModel = viewModel.with(isButtonLoading: true)
        repository.fetch { [weak self] result in
            self?.handleFetch(dollarValue: dollarValue, realValue: realValue, result: result)
        }
    }
}
