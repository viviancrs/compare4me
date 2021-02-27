import Quick
import Nimble
@testable import Compare4Me

class UIColorHexTests: QuickSpec {
    override func spec() {
        describe("#initWithHex") {
            context("when has six characters") {
                it("returns expected color") {
                    let expectedColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
                    let color = UIColor(hex: "#000000")

                    expect(color).to(equal(expectedColor))
                }
            }

            context("when is less than six characters") {
                it("returns nil") {
                    let color = UIColor(hex: "#00000")

                    expect(color).to(beNil())
                }
            }

            context("when is greater than six characters") {
                it("returns nil") {
                    let color = UIColor(hex: "#0000000")

                    expect(color).to(beNil())
                }
            }
        }

        describe("#hexColorOrDefault") {
            context("when has a valid color") {
                it("returns expected color") {
                    let expectedColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    let color = UIColor.hexColorOrDefault("#FFFFFF")

                    expect(color).to(equal(expectedColor))
                }
            }

            context("when has an invalid color") {
                it("returns default color") {
                    let defaultColor = UIColor.black
                    let color = UIColor.hexColorOrDefault("#")

                    expect(color).to(equal(defaultColor))
                }
            }
        }
    }
}
