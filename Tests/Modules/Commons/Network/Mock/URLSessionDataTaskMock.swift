import Foundation
@testable import Compare4Me

struct URLSessionDataTaskMock: URLSessionDataTaskType {
    func resume() { }
}
