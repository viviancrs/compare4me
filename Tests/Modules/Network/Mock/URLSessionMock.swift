import Foundation

class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    @Spy var invokedDataTask: URLRequest?

    var mockData: Data?
    var mockError: Error?
    var mockStatusCode: Int = 500

    override func dataTask(with request: URLRequest,
                           completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {

        invokedDataTask = request
        let url = URL(string: "http://www.example.com")!
        let response = HTTPURLResponse(url: url, statusCode: mockStatusCode, httpVersion: nil, headerFields: nil)

        return URLSessionDataTaskMock {
            completionHandler(self.mockData, response, self.mockError)
        }
    }
}
