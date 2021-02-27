import Quick
import Nimble
@testable import Compare4Me

class RouterTests: QuickSpec {

    override func spec() {
        var sut: Router!

        describe("#searchRepositories") {
            beforeEach {
                sut = .searchRepositories(page: 1)
            }

            it("has expected scheme") {
                expect(sut.scheme).to(equal("https"))
            }

            it("has expected host") {
                expect(sut.host).to(equal("api.github.com"))
            }

            it("has expected path") {
                expect(sut.path).to(equal("/search/repositories"))
            }

            it("has expected parameters") {
                expect(sut.parameters.count).to(equal(4))

                expect(sut.parameters[0].name).to(equal("q"))
                expect(sut.parameters[0].value).to(equal("language:swift"))

                expect(sut.parameters[1].name).to(equal("sort"))
                expect(sut.parameters[1].value).to(equal("stars"))

                expect(sut.parameters[2].name).to(equal("per_page"))
                expect(sut.parameters[2].value).to(equal("20"))

                expect(sut.parameters[3].name).to(equal("page"))
                expect(sut.parameters[3].value).to(equal("1"))
            }

            it("has expected method") {
                expect(sut.method).to(equal(.get))
            }
        }
    }
}
