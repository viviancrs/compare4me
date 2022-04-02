import Quick
import Nimble
@testable import Compare4Me

class HTTPClientTests: QuickSpec {

    override func spec() {
        var sut: HTTPClient!
        var mockURLSession: URLSessionMock!

        beforeEach {
            mockURLSession = URLSessionMock()

            sut = HTTPClient(session: mockURLSession)
        }

        describe("#request") {
            context("when data is valid") {
                beforeEach {
                    mockURLSession.mockData = """
                                            {
                                            \"property\": \"value\",
                                            \"property_snake_case\": \"value\"
                                            }
                                            """.data(using: .utf8)
                    mockURLSession.mockStatusCode = 200
                }

                it("calls completion with decoded object") {
                    let object = DecodableModel(property: "value", propertySnakeCase: "value")
                    let expectedResult: Result<DecodableModel, NetworkError> = .success(object)
                    let returnedResult = makeRequestAndGetResult(route: .valid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when the request is invalid") {
                it("calls completion with badRequest error") {
                    let expectedResult: Result<DecodableModel, NetworkError> = .failure(.badRequest)
                    let returnedResult = makeRequestAndGetResult(route: .invalid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when the request is valid") {
                beforeEach {
                     _ = makeRequestAndGetResult(route: .valid)
                }

                it("calls dataTask with expected scheme") {
                    expect(mockURLSession.invokedDataTask?.url?.scheme).to(equal("http"))
                }

                it("calls dataTask with expected host") {
                    expect(mockURLSession.invokedDataTask?.url?.host).to(equal("www.google.com.br"))
                }

                it("calls dataTask with expected path") {
                    expect(mockURLSession.invokedDataTask?.url?.path).to(equal("/path"))
                }

                it("calls dataTask with expected query") {
                    expect(mockURLSession.invokedDataTask?.url?.query).to(equal("name1=value1&name2=value2"))
                }

                it("calls dataTask with expected httpMethod") {
                    expect(mockURLSession.invokedDataTask?.httpMethod).to(equal(HTTPMethod.get.rawValue))
                }
            }

            context("when returns an error") {
                beforeEach {
                    mockURLSession.mockError = MockError.anError
                }

                it("calls completion with general error") {
                    let expectedResult: Result<DecodableModel, NetworkError> = .failure(.general)
                    let returnedResult = makeRequestAndGetResult(route: .valid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when does not return data") {
                beforeEach {
                    mockURLSession.mockData = nil
                }

                it("calls completion with general error") {
                    let expectedResult: Result<DecodableModel, NetworkError> = .failure(.general)
                    let returnedResult = makeRequestAndGetResult(route: .valid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when does not return response") {
                beforeEach {
                    mockURLSession.mockData = "".data(using: .utf8)
                }

                it("calls completion with general error") {
                    let expectedResult: Result<DecodableModel, NetworkError> = .failure(.general)
                    let returnedResult = makeRequestAndGetResult(route: .valid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when does not return status code 200") {
                beforeEach {
                    mockURLSession.mockData = "".data(using: .utf8)
                    mockURLSession.mockStatusCode = 404
                }

                it("calls completion with general error") {
                    let expectedResult: Result<DecodableModel, NetworkError> = .failure(.general)
                    let returnedResult = makeRequestAndGetResult(route: .valid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when return invalid data") {
                beforeEach {
                    mockURLSession.mockData = "".data(using: .utf8)
                    mockURLSession.mockStatusCode = 200
                }

                it("calls completion with general error") {
                    let expectedResult: Result<DecodableModel, NetworkError> = .failure(.general)
                    let returnedResult = makeRequestAndGetResult(route: .valid)

                    expect(returnedResult).to(equal(expectedResult))
                }
            }
        }

        func makeRequestAndGetResult(route: MockRouter) -> Result<DecodableModel, NetworkError>? {
            var result: Result<DecodableModel, NetworkError>?
            sut.request(route: route) {
                result = $0
            }
            return result
        }
    }

    struct DecodableModel: Equatable, Decodable {
        let property: String
        let propertySnakeCase: String
    }
}
