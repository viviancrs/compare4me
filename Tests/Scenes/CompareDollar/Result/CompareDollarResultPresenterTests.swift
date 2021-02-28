import Quick
import Nimble
@testable import Compare4Me

class CompareDollarResultPresenterTests: QuickSpec {

    override func spec() {
        describe("#logo") {
            it("returns not nil") {
                expect(Images.logo).toNot(beNil())
            }
        }
    }

}

struct Request {
    let realPrice: Double
    let dollarPrice: Double
    let iof: Double
    let tax: Double
    let dollarBid: Double
}

struct Response {
    let inBrasil: InBrazil
    let imported: Imported
}

extension Response {
    struct InBrazil {
        let totalInReal: Double
        let dollarByReal: Double
    }

    struct Imported {
        let totalInReal: Double
        let dollarByReal: Double

        let dollarBid: Double
        let dollarPrice: Double
        let iof: Double
        let tax: Double
    }
}
