import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDInputViewControllerTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDInputViewController!
        var mockPresenter: CompareUSDInputPresenterMock!
        var mockView: CompareUSDInputViewMock!
        var mockDelegate: CompareUSDInputDelegateMock!

        beforeEach {
            mockPresenter = CompareUSDInputPresenterMock()
            mockView = CompareUSDInputViewMock()
            mockDelegate = CompareUSDInputDelegateMock()

            sut = CompareUSDInputViewController(presenter: mockPresenter, view: mockView)
            sut.delegate = mockDelegate
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = CompareUSDInputViewController(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("#viewDidLoad") {
            beforeEach {
                _ = sut.view
            }

            it("binds didTapCompareBlock's view") {
                mockView.didTapCompareBlock?(1.0, 2.0)

                expect(mockPresenter.invokedCompare?.usdValue).to(equal(1.0))
                expect(mockPresenter.invokedCompare?.brlValue).to(equal(2.0))
                expect(mockPresenter.$invokedCompare.count).to(equal(1))
            }
        }

        describe("#show") {
            it("calls view show with expected model") {
                let viewModel = CompareUSDInputViewModel(isButtonLoading: true)
                sut.show(viewModel: viewModel)

                expect(mockView.invokedShow).toEventually(equal(viewModel))
                expect(mockView.$invokedShow.count).toEventually(equal(1))
            }
        }

        describe("#showResult") {
            it("calls view show with expected model") {
                let data = CompareUSD(usdValue: 100, brlValue: 200, usdExchangeRate: 300)
                sut.showResult(from: data)

                expect(mockDelegate.invokedShowResult).toEventually(equal(data))
                expect(mockDelegate.$invokedShowResult.count).toEventually(equal(1))
            }
        }
    }
}
