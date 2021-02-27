import Foundation

enum Router: RouterType {
    case searchRepositories(page: Int)

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.github.com"
    }

    var path: String {
        return "/search/repositories"
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .searchRepositories(let page):
            return [URLQueryItem(name: "q", value: "language:swift"),
                    URLQueryItem(name: "sort", value: "stars"),
                    URLQueryItem(name: "per_page", value: "20"),
                    URLQueryItem(name: "page", value: "\(page)")]
        }

    }

    var method: HTTPMethod {
        return .get
    }
}

//https://api.github.com/search/repositories?q=language:swift&sort=stars&per_page=20
