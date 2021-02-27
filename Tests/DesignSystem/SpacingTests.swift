import Quick
import Nimble
@testable import Compare4Me

class SpacingTests: QuickSpec {

    override func spec() {
        describe("#micro") {
            it("returns expected value") {
                expect(Spacing.micro).to(equal(4))
            }
        }

        describe("#tiny") {
            it("returns expected value") {
                expect(Spacing.tiny).to(equal(8))
            }
        }

        describe("#small") {
            it("returns expected value") {
                expect(Spacing.small).to(equal(12))
            }
        }

        describe("#standard") {
            it("returns expected value") {
                expect(Spacing.standard).to(equal(16))
            }
        }

        describe("#semi") {
            it("returns expected value") {
                expect(Spacing.semi).to(equal(24))
            }
        }

        describe("#large") {
            it("returns expected value") {
                expect(Spacing.large).to(equal(32))
            }
        }

        describe("#xLarge") {
            it("returns expected value") {
                expect(Spacing.xLarge).to(equal(48))
            }
        }
    }
}
