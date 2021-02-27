import Quick
import Nimble
@testable import Compare4Me

class HTTPMethodTests: QuickSpec {

    override func spec() {
        var sut: HTTPMethod!

        describe("#get") {
            it("has expected rawValue") {
                sut = .get
                expect(sut.rawValue).to(equal("GET"))
            }
        }
    }
}
