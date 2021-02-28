/*

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
         switch result {
         case .success(let exchangeRate):
             let tourismDollar = Double(exchangeRate.bid) ?? 0
             let teste = compare(dollarValue: dollarValue, realValue: realValue, with: tourismDollar)
             viewController?.show(result: teste)
         case .failure:
             viewController?.show(error: "Erro ao obter cotação") // TODO - substituir por API de localização
         }
     }

     private func compare(dollarValue: Double, realValue: Double, with tourismDollar: Double) -> CompareDollarResult {
         let valuesInBrazil = calculateValuesInBrazil(dollarValue: dollarValue, realValue: realValue)
         let importValues = calculateImportValues(dollarValue: dollarValue,
                                                  realValue: realValue,
                                                  tourismDollar: tourismDollar)

         let result = CompareDollarResult(valuesInBrazil: valuesInBrazil, importValues: importValues)
         return result
     }

     private func calculateValuesInBrazil(dollarValue: Double, realValue: Double) -> CompareDollarResult.InBrazil {
         let dollarByReal = realValue / dollarValue
         let valuesInBrazil = CompareDollarResult.InBrazil(totalInReal: realValue, dollarByReal: dollarByReal)
         return valuesInBrazil
     }

     private func calculateImportValues(dollarValue: Double,
                                        realValue: Double,
                                        tourismDollar: Double) -> CompareDollarResult.Import {
         let iof: Double = 1.06
         let tax: Double = 1.09

         let total = dollarValue * tax * tourismDollar * iof
         let dollarByReal = total / dollarValue

         let importValues = CompareDollarResult.Import(totalInReal: total,
                                                       dollarByReal: dollarByReal,
                                                       dollarPrice: tourismDollar,
                                                       iof: iof,
                                                       tax: tax)
         return importValues
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

 */
