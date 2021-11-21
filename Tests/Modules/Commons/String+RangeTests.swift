import Quick
import Nimble
@testable import Compare4Me

class StringRangeTests: QuickSpec {
    override func spec() {
        describe("#rangeOf") {
            describe("when text parameter is nil") {
                it("returns range with text size") {
                    let sut = "lorem ipsum dolor sit amet"
                    let text: String? = nil
                    let range = NSRange(location: 0, length: sut.count)

                    expect(sut.range(of: text)).to(equal(range))
                }
            }

            describe("when text parameter is not nil") {
                it("returns range with text location and size") {
                    let sut = "lorem ipsum dolor sit amet"
                    let text = "ipsum"
                    let range = NSRange(location: 6, length: text.count)

                    expect(sut.range(of: text)).to(equal(range))
                }
            }
        }
    }
}
