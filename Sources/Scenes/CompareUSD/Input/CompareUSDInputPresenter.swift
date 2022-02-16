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
            viewController?.showError(AppStrings.exchangeRateError.localized)
        }
    }

    private func isValid(usdValue: Double, brlValue: Double) -> Bool {
        guard usdValue > 0 else {
            self.viewModel = viewModel.with(usdValueHasError: true)
            return false
        }

        guard brlValue > 0 else {
            self.viewModel = viewModel.with(brlValueHasError: true)
            return false
        }

        return true
    }
}

extension CompareUSDInputPresenter: CompareUSDInputPresenterType {
    func compare(usdValue: Double, brlValue: Double) {
        guard isValid(usdValue: usdValue, brlValue: brlValue) else { return }

        self.viewModel = viewModel.with(isButtonLoading: true)
        repository.fetch { [weak self] result in
            self?.handleFetch(usdValue: usdValue, brlValue: brlValue, result: result)
        }
    }
}
