import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDResultIntegratedTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDResultViewController!
        var presenter: CompareUSDResultPresenter!
        var view: CompareUSDResultView!

        beforeEach {
            let data = CompareUSD(usdValue: 2800, brlValue: 20000, usdExchangeRate: 5.37)
            presenter = CompareUSDResultPresenter(data: data)

            view = CompareUSDResultView()

            sut = CompareUSDResultViewController(presenter: presenter, view: view)
            _ = sut.view
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = CompareUSDResultViewController(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("#show") {
            beforeEach {
                let section = CompareUSDResultSectionViewModel(title: "", items: [])
                let viewModel = CompareUSDResultViewModel(valuesInBrasil: section, importValues: section)
                sut.show(viewModel: viewModel)
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
