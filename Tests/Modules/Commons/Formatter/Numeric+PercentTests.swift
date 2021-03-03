import Quick
import Nimble
@testable import Compare4Me

class NumericPercentTests: QuickSpec {

    override func spec() {
        describe("#percent") {
            describe("when value is nil") {
                it("returns nil") {
                    let value: Double? = nil

                    let returnedValue = value?.percent(locale: .ptBR)
                    expect(returnedValue).to(beNil())
                }
            }

            describe("when the locale is ptBR") {
                it("returns expected value") {
                    let expectedValue = "6%"

                    let returnedValue = 0.06.percent(locale: .ptBR)
                    expect(returnedValue).to(equal(expectedValue))
                }
            }

            describe("when the locale is enUS") {
                it("returns expected value") {
                    let expectedValue = "33%"

                    let returnedValue = 0.333.percent(locale: .enUS)
                    expect(returnedValue).to(equal(expectedValue))
                }
            }
        }
    }
}
