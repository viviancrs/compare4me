import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDInputViewTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDInputView!

        var mockNotificationCenter: NotificationCenterMock!
        var viewModel: CompareUSDInputViewModel!
        beforeEach {
            mockNotificationCenter = NotificationCenterMock()

            sut = CompareUSDInputView(notificationCenter: mockNotificationCenter)
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

            viewModel = CompareUSDInputViewModel()
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = CompareUSDInputView(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("#init") {
            it("calls addKeyboardObservers") {
                expect(mockNotificationCenter.invokedAddObserver).notTo(beNil())
            }
        }

        describe("#show") {
            it("has a valid snapshot") {
                sut.show(viewModel: viewModel)

                assertSnapshot(matching: sut, as: .image, named: "standard_state")
            }

            describe("when the button is loading") {
                it("has a snapshot with loading button") {
                    viewModel = viewModel.with(isButtonLoading: true)
                    sut.show(viewModel: viewModel)

                    assertSnapshot(matching: sut, as: .image, named: "loading_state")
                }
            }

            describe("when the usd value has error") {
                it("has a snapshot with error on usd value") {
                    viewModel = viewModel.with(usdValueHasError: true)
                    sut.show(viewModel: viewModel)

                    assertSnapshot(matching: sut, as: .image, named: "error_state_usd_value")
                }
            }

            describe("when the brl value has error") {
                it("has a snapshot with error on brl value") {
                    viewModel = viewModel.with(brlValueHasError: true)
                    sut.show(viewModel: viewModel)

                    assertSnapshot(matching: sut, as: .image, named: "error_state_brl_value")
                }
            }
        }

        describe("#didUpdateKeyboard") {
            it("has a snapshot with keyboard space visible") {
                sut.didUpdateKeyboard(height: 100)
                assertSnapshot(matching: sut, as: .image, named: "with_keyboard_space_visible")
            }
        }

        describe("when press compare button") {
            var usdValueToCompare: Double?
            var brlValueToCompare: Double?

            beforeEach {
                usdValueToCompare = nil
                brlValueToCompare = nil

                sut.didTapCompareBlock = { (usdValue, blrValue) in
                    usdValueToCompare = usdValue
                    brlValueToCompare = blrValue
                }
            }

            describe("and the values are nil") {
                it("calls didTapCompareBlock with default values") {
                    sut.compareButton.sendActions(for: .touchUpInside)

                    expect(brlValueToCompare).to(be(0.0))
                    expect(usdValueToCompare).to(be(0.0))
                }
            }

            describe("and the values are filled") {
                it("calls didTapCompareBlock with expected s") {
                    sut.usdTextField.text = "100"
                    sut.brlTextField.text = "200"

                    sut.compareButton.sendActions(for: .touchUpInside)

                    expect(usdValueToCompare).to(be(100.0))
                    expect(brlValueToCompare).to(be(200.0))
                }
            }
        }
    }
}
