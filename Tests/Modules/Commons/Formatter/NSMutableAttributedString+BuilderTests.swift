import Quick
import Nimble
@testable import Compare4Me

class NSMutableAttributedStringBuilderTests: QuickSpec {
    override func spec() {
        let string = "Lorem ipsum dolor sit amet."
        let substring = "ipsum"

        describe("#applyFont") {
            describe("when the text is nil") {
                it("returns attributed string with applied font at zero location") {
                    let expectedFont = UIFont.preferredFont(forTextStyle: .body)

                    let sut = NSMutableAttributedString(string: string)
                        .apply(font: expectedFont)

                    let attribute = sut.attributes(at: 0, effectiveRange: nil).first
                    expect(attribute?.key).to(equal(.font))
                    expect(attribute?.value as? UIFont).to(equal(expectedFont))
                }
            }

            describe("when the text is not nil") {
                it("returns attributed string with applied font at expected location") {
                    let expectedFont = UIFont.preferredFont(forTextStyle: .body)
                    let expectedLocation = string.range(of: substring).location

                    let sut = NSMutableAttributedString(string: string)
                        .apply(font: expectedFont, in: substring)

                    let attribute = sut.attributes(at: expectedLocation, effectiveRange: nil).first
                    expect(attribute?.key).to(equal(.font))
                    expect(attribute?.value as? UIFont).to(equal(expectedFont))
                }
            }
        }
    }
}
