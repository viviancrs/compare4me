import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDInputIntegratedTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDInputViewController!
        var presenter: CompareUSDInputPresenter!
        var view: CompareUSDInputView!

        beforeEach {
            presenter = CompareUSDInputPresenter()
            view = CompareUSDInputView()

            sut = CompareUSDInputViewController(presenter: presenter, view: view)
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
