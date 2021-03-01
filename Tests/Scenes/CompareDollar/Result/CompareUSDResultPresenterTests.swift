import Quick
import Nimble
@testable import Compare4Me

class CompareUSDResultPresenterTests: QuickSpec {

    override func spec() {
        var sut: CompareUSDResultPresenter!

        var mockViewController: CompareUSDResultViewControllerMock!
        var data: CompareUSD!

        beforeEach {
            mockViewController = CompareUSDResultViewControllerMock()
            data = CompareUSD(usdValue: 2800, brlValue: 20000, usdExchangeRate: 5.37)

            sut = CompareUSDResultPresenter(data: data)
            sut.viewController = mockViewController
        }

//        describe("#compare") {
//            it("calls viewController show result with expected values") {
//                sut.viewWillAppear()
//
//                let returned = mockViewController.invokedShow
//
//                expect(mockViewController.$invokedShow.count).to(equal(1))
//                expect(returned?.valuesInBrasil.totalInBRL).to(equal("20000.0"))
//                expect(returned?.valuesInBrasil.usdByBRL).to(equal("7.142857142857143"))
//
//                expect(returned?.importValues.totalInBRL).to(equal("17372.5944"))
//                expect(returned?.importValues.usdByBRL).to(equal("6.204498000000001"))
//                expect(returned?.importValues.usdExchangeRate).to(equal("5.37"))
//                expect(returned?.importValues.tax).to(equal("1.09"))
//                expect(returned?.importValues.iof).to(equal("1.06"))
//            }
//        }
    }
}
