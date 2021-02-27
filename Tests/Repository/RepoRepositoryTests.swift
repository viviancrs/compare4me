import Quick
import Nimble
@testable import Compare4Me

class RepoRepositoryTests: QuickSpec {

    override func spec() {
        var sut: RepoRepository!
        var mockClient: HTTPClientMock<Router>!

        beforeEach {
            mockClient = HTTPClientMock()
            sut = RepoRepository(client: mockClient)
        }

        describe("#fetch") {
            it("calls client with router") {
                _ = makeRequestAndGetResult(page: 1)

                expect(mockClient.invokedRequest).to(equal(Router.searchRepositories(page: 1)))
            }

            context("when it is successful") {
                it("calls completion with success") {
                    let owner = RepoOwner(login: "owner")
                    let repo = Repo(name: "name", stargazersCount: 1, watchersCount: 1, owner: owner)
                    let searchResult = RepoSearchResult(items: [repo])
                    let expectedResult: Result<RepoSearchResult, NetworkError> = .success(searchResult)

                    mockClient.mockModel = searchResult
                    let returnedResult = makeRequestAndGetResult(page: 1)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when it fails") {
                it("calls completion with error") {
                    let expectedResult: Result<RepoSearchResult, NetworkError> = .failure(.general)

                    mockClient.mockError = .general
                    let returnedResult = makeRequestAndGetResult(page: 1)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }
        }

        func makeRequestAndGetResult(page: Int) -> Result<RepoSearchResult, NetworkError>? {
            var result: Result<RepoSearchResult, NetworkError>?
            sut.fetch(page: 1) {
                result = $0
            }
            return result
        }
    }
}
