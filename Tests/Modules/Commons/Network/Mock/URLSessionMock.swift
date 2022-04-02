import Foundation
@testable import Compare4Me

class URLSessionMock: URLSessionType {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    @Spy var invokedDataTask: URLRequest?

    var mockData: Data?
    var mockError: Error?
    var mockStatusCode: Int = 500

    func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTaskType {

        invokedDataTask = request
        let url = URL(string: "http://www.example.com")!
        let response = HTTPURLResponse(url: url, statusCode: mockStatusCode, httpVersion: nil, headerFields: nil)

        completionHandler(self.mockData, response, self.mockError)
        return URLSessionDataTaskMock()
    }
}
