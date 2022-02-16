import Quick
import Nimble
@testable import Compare4Me

class CompareUSDInputPresenterTests: QuickSpec {

    override func spec() {
        var sut: CompareUSDInputPresenter!
        var mockRepository: ExchangeRateRepositoryMock!
        var mockViewController: CompareUSDInputViewControllerMock!

        beforeEach {
            mockRepository = ExchangeRateRepositoryMock()
            mockViewController = CompareUSDInputViewControllerMock()
            sut = CompareUSDInputPresenter(repository: mockRepository)
            sut.viewController = mockViewController
        }

        describe("#compare") {
            it("calls repository with expected values") {
                sut.compare(usdValue: 1.0, brlValue: 2.0)

                expect(mockRepository.$invokedFetch.count).to(equal(1))
            }

            it("calls viewController show view model with loading state") {
                let expectedViewModel = CompareUSDInputViewModel(isButtonLoading: true)

                sut.compare(usdValue: 1.0, brlValue: 2.0)

                expect(mockViewController.invokedShow).to(equal(expectedViewModel))
                expect(mockViewController.$invokedShow.count).to(equal(1))
            }

            context("when USD value is zero") {
                beforeEach {
                    let model = ExchangeRate(bid: "3.0")
                    mockRepository.mockResult = Result.success(model)

                    sut.compare(usdValue: 0, brlValue: 2.0)
                }

                it("calls viewController show view model with usd value has error") {
                    let expectedViewModel = CompareUSDInputViewModel(usdValueHasError: true)

                    expect(mockViewController.invokedShow).to(equal(expectedViewModel))
                    expect(mockViewController.$invokedShow.count).to(equal(1))
                }
            }

            context("when BRL value is zero") {
                beforeEach {
                    let model = ExchangeRate(bid: "3.0")
                    mockRepository.mockResult = Result.success(model)

                    sut.compare(usdValue: 1.0, brlValue: 0.0)
                }

                it("calls viewController show view model with brl value has error") {
                    let expectedViewModel = CompareUSDInputViewModel(brlValueHasError: true)

                    expect(mockViewController.invokedShow).to(equal(expectedViewModel))
                    expect(mockViewController.$invokedShow.count).to(equal(1))
                }
            }

            context("when it is successful") {
                beforeEach {
                    let model = ExchangeRate(bid: "3.0")
                    mockRepository.mockResult = Result.success(model)

                    sut.compare(usdValue: 1.0, brlValue: 2.0)
                }

                it("calls viewController show view model with no loading state") {
                    let expectedViewModel = CompareUSDInputViewModel(isButtonLoading: false)

                    expect(mockViewController.invokedShow).to(equal(expectedViewModel))
                    expect(mockViewController.$invokedShow.count).to(equal(2))
                }

                it("calls viewController show result with expected data") {
                    let expectedData = CompareUSD(usdValue: 1.0, brlValue: 2.0, usdExchangeRate: 3.0)

                    expect(mockViewController.invokedShowResult).to(equal(expectedData))
                    expect(mockViewController.$invokedShowResult.count).to(equal(1))
                }
            }

            context("when it fails") {
                beforeEach {
                    mockRepository.mockResult = Result.failure(NetworkError.general)

                    sut.compare(usdValue: 1.0, brlValue: 2.0)
                }

                it("calls viewController show error") {
                    expect(mockViewController.invokedShowError).to(equal(AppStrings.exchangeRateError.localized))
                    expect(mockViewController.$invokedShowError.count).to(equal(1))
                }
            }
        }
    }
}
