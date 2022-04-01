import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDResultIntegratedTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDResultViewController!
        var presenter: CompareUSDResultPresenter!

        beforeEach {
            let data = CompareUSD(usdValue: 280, brlValue: 990, usdExchangeRate: 4.79)
            presenter = CompareUSDResultPresenter(data: data)

            sut = CompareUSDResultViewController(presenter: presenter)
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

            it("has expected snapshot") {
                assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax), named: "iPhoneXsMax")
            }

            describe("when there is no safe area") {
                it("has expected snapshot with no safe area") {
                    assertSnapshot(matching: sut, as: .image(on: .iPhone8), named: "iPhon8")
                }
            }

            describe("when using dark mode") {
                it("has expected snapshot with dark mode") {
                    let traitDarkMode = UITraitCollection(userInterfaceStyle: .dark)
                    assertSnapshot(matching: sut, as: .image(on: .iPhone8, traits: traitDarkMode), named: "darkMode")
                }
            }
        }
    }
}
