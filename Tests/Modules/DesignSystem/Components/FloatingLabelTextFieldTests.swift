import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class FloatingLabelTextFieldTests: QuickSpec {

    override func spec() {
        var sut: FloatingLabelTextField!

        beforeEach {
            sut = FloatingLabelTextField()
            sut.frame = CGRect(x: 0, y: 0, width: 100, height: 56)
            sut.title = "Title"
            sut.placeholder = "Placeholder"
            sut.error = "An error message"
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = FloatingLabelTextField(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("when there is a text") {
            beforeEach {
                sut.text = "Text"
            }

            it("has standard state") {
                assertSnapshot(matching: sut, as: .image, named: "with_text_standard_state")
            }

            describe("when there is an error") {
                it("has error state") {
                    sut.hasError = true

                    assertSnapshot(matching: sut, as: .image, named: "with_text_error_state")
                }
            }

            describe("when become first responder") {
                beforeEach {
                    _ = sut.becomeFirstResponder()
                }

                it("has focus state") {
                    assertSnapshot(matching: sut, as: .image, named: "with_text_focus_state")
                }

                describe("when resign first responder") {
                    it("has standard state") {
                        _ = sut.resignFirstResponder()

                        assertSnapshot(matching: sut, as: .image,
                                       named: "with_text_stardard_state_after_resign_responder")
                    }
                }
            }
        }

        describe("when there is not a text") {
            beforeEach {
                sut.text = ""
            }

            it("has standard state") {
                assertSnapshot(matching: sut, as: .image, named: "no_text_standard_state")
            }

            describe("when there is an error") {
                it("has error state") {
                    sut.hasError = true

                    assertSnapshot(matching: sut, as: .image, named: "no_text_error_state")
                }
            }

            describe("when become first responder") {
                beforeEach {
                    _ = sut.becomeFirstResponder()
                }

                it("has focus state") {
                    assertSnapshot(matching: sut, as: .image, named: "no_text_focus_state")
                }

                describe("when resign first responder") {
                    it("has standard state") {
                        _ = sut.resignFirstResponder()

                        assertSnapshot(matching: sut, as: .image,
                                       named: "no_text_stardard_state_after_resign_responder")
                    }
                }
            }
        }
    }
}
