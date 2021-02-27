struct Repo: Equatable, Decodable {
    let name: String
    let stargazersCount: Int
    let watchersCount: Int
    let owner: RepoOwner
}
