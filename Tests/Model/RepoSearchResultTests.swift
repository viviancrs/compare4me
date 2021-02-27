import Quick
import Nimble
@testable import Compare4Me

class RepoSearchResultTests: QuickSpec {

    override func spec() {
        var sut: RepoSearchResult?

        describe("#decodable") {
            it("decodes json with expected rawValue") {
                sut = MockHelper.decode(from: "RepoSearchResult")
                expect(sut?.items.count).to(equal(2))
                expect(sut?.items.first?.name).to(equal("awesome-ios"))
                expect(sut?.items.first?.owner.login).to(equal("vsouza"))
                expect(sut?.items.first?.stargazersCount).to(equal(35630))
                expect(sut?.items.first?.watchersCount).to(equal(35630))
            }
        }
    }
}
