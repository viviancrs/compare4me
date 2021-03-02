import Quick
import Nimble
@testable import Compare4Me

class ColorsTests: QuickSpec {

    override func spec() {
        describe("#BrandPrimary") {
            describe("#primary") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#364F6B")
                    expect(Colors.BrandPrimary.primary?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onPrimary") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#FFFFFF")
                    expect(Colors.BrandPrimary.onPrimary?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }
        }

        describe("#Neutrals") {
            describe("#neutral10") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#ffffff")
                    expect(Colors.Neutrals.neutral0?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#neutral20") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#C7CEC9")
                    expect(Colors.Neutrals.neutral20?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#neutral60") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#6F7974")
                    expect(Colors.Neutrals.neutral60?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#neutral80") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#596B64")
                    expect(Colors.Neutrals.neutral80?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#neutral90") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#1F2D27")
                    expect(Colors.Neutrals.neutral90?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#neutral100") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#000000")
                    expect(Colors.Neutrals.neutral100?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }
        }
    }
}
