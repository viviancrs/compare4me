import Quick
import Nimble
@testable import Compare4Me

class RouteTests: QuickSpec {

    override func spec() {
        var sut: Route!

        describe("#exchangeRate") {
            beforeEach {
                sut = .exchangeRate(fromSymbol: .usdt, toSymbol: .brl)
            }

            it("has expected scheme") {
                expect(sut.scheme).to(equal("https"))
            }

            it("has expected host") {
                expect(sut.host).to(equal("economia.awesomeapi.com.br"))
            }

            it("has expected path") {
                expect(sut.path).to(equal("/json/all/USDT-BRL"))
            }

            it("has expected parameters") {
                expect(sut.parameters.count).to(equal(0))
            }

            it("has expected method") {
                expect(sut.method).to(equal(.get))
            }
        }
    }
}
