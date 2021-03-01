protocol CompareUSDResultViewControllerType: AnyObject {
    func show(viewModel: CompareUSDResultViewModel)
}

protocol CompareUSDResultPresenterType {
    var viewController: CompareUSDResultViewControllerType? { get set }
    func viewWillAppear()
}

class CompareUSDResultPresenter {
    weak var viewController: CompareUSDResultViewControllerType?
    private let data: CompareUSD
    private let iof = 1.06
    private let tax = 1.09

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
        let usdByBRL = data.brlValue / data.usdValue

        var items = [CompareUSDResultSectionViewModel.Item]()
        items.append(.init(title: AppStrings.total.localized, value: "\(data.brlValue)"))
        items.append(.init(title: AppStrings.usdByBRL.localized, value: "\(usdByBRL)"))

        let valuesInBrazil = CompareUSDResultSectionViewModel(title: AppStrings.priceInBrazil.localized,
                                                              items: items)
        return valuesInBrazil
    }

    private func calculateImportValues() -> CompareUSDResultSectionViewModel {
        let total = data.usdValue * tax * data.usdExchangeRate * iof
        let usdByBRL = total / data.usdValue

        var items = [CompareUSDResultSectionViewModel.Item]()
        items.append(.init(title: AppStrings.total.localized, value: "\(total)"))
        items.append(.init(title: AppStrings.priceInTheUSA.localized, value: "\(data.usdValue)"))
        items.append(.init(title: AppStrings.usdByBRL.localized, value: "\(usdByBRL)"))
        items.append(.init(title: AppStrings.importTax.localized, value: "\(tax)"))
        items.append(.init(title: AppStrings.iof.localized, value: "\(iof)"))

        let importValues = CompareUSDResultSectionViewModel(title: AppStrings.importingPrice.localized,
                                                            items: items)

        return importValues
    }
}

extension CompareUSDResultPresenter: CompareUSDResultPresenterType {
    func viewWillAppear() {
        let valuesInBrazil = calculateValuesInBrazil()
        let importValues = calculateImportValues()

        let viewModel = CompareUSDResultViewModel(valuesInBrasil: valuesInBrazil,
                                                  importValues: importValues)
        self.viewModel = viewModel
    }
}
