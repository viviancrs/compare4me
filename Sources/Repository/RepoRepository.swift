import Foundation

protocol RepoRepositoryType {
    func fetch(page: Int, completion: @escaping (Result<RepoSearchResult, NetworkError>) -> Void)
}

struct RepoRepository: RepoRepositoryType {
    let client: HTTPClientType

    init(client: HTTPClientType = HTTPClient()) {
        self.client = client
    }

    func fetch(page: Int, completion: @escaping (Result<RepoSearchResult, NetworkError>) -> Void) {
        client.request(router: Router.searchRepositories(page: page),
                       completion: completion)
    }
}
