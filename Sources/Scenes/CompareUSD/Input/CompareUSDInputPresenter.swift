protocol CompareUSDInputPresenterType {
    var viewController: CompareUSDInputViewControllerType? { get set }
    func compare(usdValue: Double, brlValue: Double)
}

class CompareUSDInputPresenter {
    weak var viewController: CompareUSDInputViewControllerType?
    private let repository: ExchangeRateRepositoryType

    private var viewModel: CompareUSDInputViewModel {
        didSet {
            viewController?.show(viewModel: viewModel)
        }
    }

    init(repository: ExchangeRateRepositoryType = ExchangeRateRepository()) {
        self.repository = repository
        self.viewModel = CompareUSDInputViewModel()
    }

    private func handleFetch(usdValue: Double, brlValue: Double, result: Result<ExchangeRate, NetworkError>) {
        self.viewModel = viewModel.with(isButtonLoading: false)

        switch result {
        case .success(let exchangeRate):
            let usdExchangeRate = Double(exchangeRate.bid) ?? 0
            let data = CompareUSD(usdValue: usdValue, brlValue: brlValue, usdExchangeRate: usdExchangeRate)
            viewController?.showResult(from: data)
        case .failure:
            viewController?.showError("Erro ao obter cotação") // TODO - substituir por API de localização
        }
    }
}

extension CompareUSDInputPresenter: CompareUSDInputPresenterType {
    func compare(usdValue: Double, brlValue: Double) {
        self.viewModel = viewModel.with(isButtonLoading: true)
        repository.fetch { [weak self] result in
            self?.handleFetch(usdValue: usdValue, brlValue: brlValue, result: result)
        }
    }
}
