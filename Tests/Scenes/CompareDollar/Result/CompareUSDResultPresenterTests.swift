import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDResultPresenterTests: QuickSpec {

    override func spec() {
        var sut: CompareUSDResultPresenter!

        var data: CompareUSD!
        var viewController: CompareUSDResultViewController!

        beforeEach {
            data = CompareUSD(usdValue: 2800, brlValue: 20000, usdExchangeRate: 5.37)
            sut = CompareUSDResultPresenter(data: data)

            viewController = CompareUSDResultViewController(presenter: sut)
            viewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
            sut.viewController = viewController
        }

        describe("#viewDidLoad") {
            it("calls viewController show with expected values") {
                assertSnapshot(matching: viewController.view, as: .image)
            }
        }
    }
}
