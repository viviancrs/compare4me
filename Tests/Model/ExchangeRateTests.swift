import Quick
import Nimble
@testable import Compare4Me

class ExchangeRateTests: QuickSpec {

    override func spec() {
        var sut: ExchangeRate?

        describe("#decodable") {
            it("decodes json with expected rawValue") {
                sut = MockHelper.decode(from: "ExchangeRate")
                expect(sut?.bid).to(equal("5.5986"))
            }
        }
    }
}
