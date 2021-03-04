import Quick
import Nimble
@testable import Compare4Me

class ColorsPrimaryTests: QuickSpec {

    override func spec() {
        describe("#Primary") {
            describe("#primary") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#0277BD")
                    expect(Colors.Primary.primary?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onPrimary") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#ffffff")
                    expect(Colors.Primary.onPrimary?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#primaryLight") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#58A5F0")
                    expect(Colors.Primary.primaryLight?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onPrimaryLight") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#333333")
                    expect(Colors.Primary.onPrimaryLight?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#primaryDark") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#004C8C")
                    expect(Colors.Primary.primaryDark?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onPrimaryDark") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#ffffff")
                    expect(Colors.Primary.onPrimaryDark?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }
        }
    }
}
