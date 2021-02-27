import Quick
import Nimble
@testable import Compare4Me

class Sizestests: QuickSpec {

    override func spec() {
        describe("#micro") {
            it("returns expectedd value") {
                expect(Sizes.micro).to(equal(4))
            }
        }

        describe("#tiny") {
            it("returns expectedd value") {
                expect(Sizes.tiny).to(equal(8))
            }
        }

        describe("#small") {
            it("returns expectedd value") {
                expect(Sizes.small).to(equal(12))
            }
        }

        describe("#standard") {
            it("returns expectedd value") {
                expect(Sizes.standard).to(equal(16))
            }
        }

        describe("#semi") {
            it("returns expectedd value") {
                expect(Sizes.semi).to(equal(24))
            }
        }

        describe("#semiX") {
            it("returns expectedd value") {
                expect(Sizes.semiX).to(equal(32))
            }
        }
        describe("#medium") {
            it("returns expectedd value") {
                expect(Sizes.medium).to(equal(40))
            }
        }

        describe("#mediumX") {
            it("returns expectedd value") {
                expect(Sizes.mediumX).to(equal(48))
            }
        }

        describe("#large") {
            it("returns expectedd value") {
                expect(Sizes.large).to(equal(56))
            }
        }

        describe("#largeX") {
            it("returns expectedd value") {
                expect(Sizes.largeX).to(equal(64))
            }
        }

        describe("#largeXX") {
            it("returns expectedd value") {
                expect(Sizes.largeXX).to(equal(72))
            }
        }

        describe("#largeXXX") {
            it("returns expectedd value") {
                expect(Sizes.largeXXX).to(equal(80))
            }
        }

        describe("#huge") {
            it("returns expectedd value") {
                expect(Sizes.huge).to(equal(88))
            }
        }

        describe("#hugeX") {
            it("returns expectedd value") {
                expect(Sizes.hugeX).to(equal(128))
            }
        }

        describe("#hugeXX") {
            it("returns expectedd value") {
                expect(Sizes.hugeXX).to(equal(144))
            }
        }

        describe("#hugeXXX") {
            it("returns expectedd value") {
                expect(Sizes.hugeXXX).to(equal(192))
            }
        }

        describe("#veryHuge") {
            it("returns expectedd value") {
                expect(Sizes.veryHuge).to(equal(256))
            }
        }
    }
}
