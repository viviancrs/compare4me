import Quick
import Nimble
@testable import Compare4Me

class ColorsContentTests: QuickSpec {

    override func spec() {
        describe("#Content") {
            describe("#highlight") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#000000")
                    expect(Colors.Content.highlight?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#lowEmphasis") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#BBBBBB")
                    expect(Colors.Content.lowEmphasis?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#mediumEmphasis") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#777777")
                    expect(Colors.Content.mediumEmphasis?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#highEmphasis") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#333333")
                    expect(Colors.Content.highEmphasis?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }
        }
    }
}
