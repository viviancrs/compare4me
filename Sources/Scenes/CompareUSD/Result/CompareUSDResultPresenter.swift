protocol CompareUSDResultPresenterType {
    var viewController: CompareUSDResultViewControllerType? { get set }
    func viewDidLoad()
}

class CompareUSDResultPresenter {
    weak var viewController: CompareUSDResultViewControllerType?
    private let data: CompareUSD
    private let iof = 0.06
    private let tax = 0.09

    private var viewModel: CompareUSDResultViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            viewController?.show(viewModel: viewModel)
        }
    }

    init(data: CompareUSD) {
        self.data = data
    }

    private func calculateValuesInBrazil() -> CompareUSDResultSectionViewModel {
        let brlByUSD = data.brlValue / data.usdValue

        var items = [CompareUSDResultSectionViewModel.Item]()
        items.append(.init(title: AppStrings.total.localized, value: data.brlValue.currency(locale: .ptBR)))
        items.append(.init(title: AppStrings.brlByUSD.localized, value: brlByUSD.currency(locale: .ptBR)))

        let valuesInBrazil = CompareUSDResultSectionViewModel(title: AppStrings.priceInBrazil.localized,
                                                              items: items)
        return valuesInBrazil
    }

    private func calculateImportValues() -> CompareUSDResultSectionViewModel {
        let total = data.usdValue * (tax + 1) * data.usdExchangeRate * (iof + 1)
        let brlByUSD = total / data.usdValue

        var items = [CompareUSDResultSectionViewModel.Item]()
        items.append(.init(title: AppStrings.total.localized, value: total.currency(locale: .ptBR)))
        items.append(.init(title: AppStrings.priceInTheUSA.localized, value: data.usdValue.currency(locale: .enUS)))
        items.append(.init(title: AppStrings.exchangeRate.localized, value: brlByUSD.currency(locale: .ptBR)))
        items.append(.init(title: AppStrings.importTax.localized, value: tax.percent(locale: .ptBR)))
        items.append(.init(title: AppStrings.iof.localized, value: iof.percent(locale: .ptBR)))

        let importValues = CompareUSDResultSectionViewModel(title: AppStrings.importingPrice.localized,
                                                            items: items)

        return importValues
    }
}

extension CompareUSDResultPresenter: CompareUSDResultPresenterType {
    func viewDidLoad() {
        let valuesInBrazil = calculateValuesInBrazil()
        let importValues = calculateImportValues()

        let viewModel = CompareUSDResultViewModel(valuesInBrasil: valuesInBrazil,
                                                  importValues: importValues)
        self.viewModel = viewModel
    }
}
