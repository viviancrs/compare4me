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

    private func calculateValuesInBrazil() -> CompareUSDResultViewModel.ValuesInBrazil {
        let usdByBRL = data.brlValue / data.usdValue
        let valuesInBrazil = CompareUSDResultViewModel.ValuesInBrazil(totalInBRL: "\(data.brlValue)",
                                                                      usdByBRL: "\(usdByBRL)")
        return valuesInBrazil
    }

    private func calculateImportValues() -> CompareUSDResultViewModel.ImportValues {
        let total = data.usdValue * tax * data.usdExchangeRate * iof
        let usdByBRL = total / data.usdValue

        let importValues = CompareUSDResultViewModel.ImportValues(totalInBRL: "\(total)",
                                                                  usdByBRL: "\(usdByBRL)",
                                                                  usdExchangeRate: "\(data.usdExchangeRate)",
                                                                  iof: "\(iof)",
                                                                  tax: "\(tax)")
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
