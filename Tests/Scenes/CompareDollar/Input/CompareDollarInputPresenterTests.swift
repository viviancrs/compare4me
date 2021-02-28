import Quick
import Nimble
@testable import Compare4Me

class CompareDollarInputPresenterTests: QuickSpec {

    override func spec() {
        var sut: CompareDollarInputPresenter!
        var mockRepository: ExchangeRateRepositoryMock!
        var mockViewController: CompareDollarInputViewControllerMock!

        beforeEach {
            mockRepository = ExchangeRateRepositoryMock()
            mockViewController = CompareDollarInputViewControllerMock()
            sut = CompareDollarInputPresenter(repository: mockRepository)
            sut.viewController = mockViewController
        }

        describe("#compare") {
            it("calls repository with expected values") {
                sut.compare(dollarValue: 1.0, realValue: 2.0)

                expect(mockRepository.$invokedFetch.count).to(equal(1))
            }

            it("calls viewController show view model with loading state") {
                let expectedViewModel = CompareDollarInputViewModel(isButtonLoading: true)

                sut.compare(dollarValue: 1.0, realValue: 2.0)

                expect(mockViewController.invokedShow).to(equal(expectedViewModel))
                expect(mockViewController.$invokedShow.count).to(equal(1))
            }

            context("when it is successful") {
                beforeEach {
                    let model = ExchangeRate(bid: "3.0")
                    mockRepository.mockResult = Result.success(model)

                    sut.compare(dollarValue: 1.0, realValue: 2.0)
                }

                it("calls viewController show view model with no loading state") {
                    let expectedViewModel = CompareDollarInputViewModel(isButtonLoading: false)

                    expect(mockViewController.invokedShow).to(equal(expectedViewModel))
                    expect(mockViewController.$invokedShow.count).to(equal(2))
                }

                it("calls viewController show result with expected data") {
                    let expectedData = CompareDollar(totalInDollar: 1.0, totalInReal: 2.0, dollarPrice: 3.0)

                    expect(mockViewController.invokedShowResult).to(equal(expectedData))
                    expect(mockViewController.$invokedShowResult.count).to(equal(1))
                }
            }

            context("when it fails") {
                beforeEach {
                    mockRepository.mockResult = Result.failure(NetworkError.general)

                    sut.compare(dollarValue: 1.0, realValue: 2.0)
                }

                it("calls viewController show error") {
                    expect(mockViewController.invokedShowError).to(equal("Erro ao obter cotação"))
                    expect(mockViewController.$invokedShowError.count).to(equal(1))
                }
            }
        }
    }
}
