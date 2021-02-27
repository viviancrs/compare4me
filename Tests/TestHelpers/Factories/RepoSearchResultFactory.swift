import Foundation
@testable import Compare4Me

struct RepoSearchResultFactory: FactoryProtocol {
    func build() -> RepoSearchResult? {
        return decode(from: "RepoSearchResult")
    }
}
