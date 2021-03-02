import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class ButtonTests: QuickSpec {

    override func spec() {
        var sut: Button!

        beforeEach {
            sut = Button(title: "Title")
            sut.frame = CGRect(x: 0, y: 0, width: 100, height: 48)
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = Button(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("#isLoading") {
            describe("when is true") {
                it("has loading state") {
                    sut.isLoading = true

                    assertSnapshot(matching: sut, as: .image)
                }
            }

            describe("when is not true") {
                it("has standard state") {
                    sut.isLoading = false

                    assertSnapshot(matching: sut, as: .image)
                }
            }
        }
    }
}
