import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDResultViewControllerTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDResultViewController!
        var mockPresenter: CompareUSDResultPresenterMock!
        var mockView: CompareUSDResultViewMock!

        beforeEach {
            mockPresenter = CompareUSDResultPresenterMock()
            mockView = CompareUSDResultViewMock()

            sut = CompareUSDResultViewController(presenter: mockPresenter, view: mockView)
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = CompareUSDResultViewController(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("#viewDidLoad") {
            beforeEach {
                _ = sut.view
            }

            it("calls presenter invokedViewDidLoad") {
                expect(mockPresenter.$invokedViewDidLoad.count).to(equal(1))
            }
        }

        describe("#show") {
            it("calls view show with expected model") {
                let section = CompareUSDResultSectionViewModel(title: "", items: [])
                let viewModel = CompareUSDResultViewModel(valuesInBrasil: section, importValues: section)
                sut.show(viewModel: viewModel)

                expect(mockView.invokedShow).toEventually(equal(viewModel))
                expect(mockView.$invokedShow.count).toEventually(equal(1))
            }
        }
    }
}
