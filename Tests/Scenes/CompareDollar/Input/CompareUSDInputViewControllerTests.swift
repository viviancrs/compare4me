import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDInputViewControllerTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDInputViewController!
        var mockPresenter: CompareUSDInputPresenterMock!
        var mockView: CompareUSDInputViewMock!

        beforeEach {
            mockPresenter = CompareUSDInputPresenterMock()
            mockView = CompareUSDInputViewMock()

            sut = CompareUSDInputViewController(presenter: mockPresenter, view: mockView)
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
    }
}
