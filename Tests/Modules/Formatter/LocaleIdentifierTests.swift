import Quick
import Nimble
@testable import Compare4Me

class LocaleIdentifierTests: QuickSpec {

    override func spec() {
        var sut: LocaleIdentifier!

        describe("#enUS") {
            it("has expected rawValue") {
                sut = .enUS
                expect(sut.rawValue).to(equal("en_US"))
            }
        }

        describe("#ptBR") {
            it("has expected rawValue") {
                sut = .ptBR
                expect(sut.rawValue).to(equal("pt_BR"))
            }
        }
    }

}
