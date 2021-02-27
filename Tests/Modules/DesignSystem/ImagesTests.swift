import Quick
import Nimble
@testable import Compare4Me

class ImagesTests: QuickSpec {

    override func spec() {
        describe("#logo") {
            it("returns not nil") {
                expect(Images.logo).toNot(beNil())
            }
        }
    }
}
