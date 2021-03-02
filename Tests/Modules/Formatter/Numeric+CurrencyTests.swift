import Quick
import Nimble
@testable import Compare4Me

class NumericCurrencyTests: QuickSpec {

    override func spec() {
        describe("#currency") {
            describe("when the locale is ptBR") {
                it("returns expected value") {
                    let expectedValue = "R$ 1.234,56"

                    let returnedValue = 1234.56.currency(locale: .ptBR)
                    expect(returnedValue).to(equal(expectedValue))
                }
            }

            describe("when the locale is enUS") {
                it("returns expected value") {
                    let expectedValue = "$1,234.56"

                    let returnedValue = 1234.56.currency(locale: .enUS)
                    expect(returnedValue).to(equal(expectedValue))
                }
            }
        }
    }
}
