import Foundation

protocol URLSessionType {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskType
}

protocol URLSessionDataTaskType {
    func resume()
}

extension URLSession: URLSessionType {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskType {
        return (dataTask(with: request,
                         completionHandler: completionHandler) as URLSessionDataTask) as URLSessionDataTaskType
    }
}

extension URLSessionDataTask: URLSessionDataTaskType {}
