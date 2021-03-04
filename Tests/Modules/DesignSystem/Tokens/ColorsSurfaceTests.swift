import Quick
import Nimble
@testable import Compare4Me

class ColorsSurfaceTests: QuickSpec {

    override func spec() {
        describe("#Surface") {
            describe("#background") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#FAFAFA")
                    expect(Colors.Surface.background?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onBackground") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#333333")
                    expect(Colors.Surface.onBackground?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#surface") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#B7B7B7")
                    expect(Colors.Surface.surface?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onSurface") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#333333")
                    expect(Colors.Surface.onSurface?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }
        }
    }
}
