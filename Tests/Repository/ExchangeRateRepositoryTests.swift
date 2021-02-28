import Quick
import Nimble
@testable import Compare4Me

class ExchangeRateRepositoryTests: QuickSpec {

    override func spec() {
        var sut: ExchangeRateRepository!
        var mockClient: HTTPClientMock<Route>!

        beforeEach {
            mockClient = HTTPClientMock()
            sut = ExchangeRateRepository(client: mockClient)
        }

        describe("#fetch") {
            it("calls client with route") {
                _ = makeRequestAndGetResult()

                expect(mockClient.invokedRequest).to(equal(Route.exchangeRate(fromSymbol: .usdt, toSymbol: .brl)))
            }

            context("when it is successful") {
                it("calls completion with success") {
                    let exchangeRateResult = ExchangeRate(bid: "1.25")
                    let expectedResult: Result<ExchangeRate, NetworkError> = .success(exchangeRateResult)

                    mockClient.mockModel = exchangeRateResult
                    let returnedResult = makeRequestAndGetResult()

                    expect(returnedResult).to(equal(expectedResult))
                }
            }

            context("when it fails") {
                it("calls completion with error") {
                    let expectedResult: Result<ExchangeRate, NetworkError> = .failure(.general)

                    mockClient.mockError = .general
                    let returnedResult = makeRequestAndGetResult()

                    expect(returnedResult).to(equal(expectedResult))
                }
            }
        }

        func makeRequestAndGetResult() -> Result<ExchangeRate, NetworkError>? {
            var result: Result<ExchangeRate, NetworkError>?
            sut.fetch {
                result = $0
            }
            return result
        }
    }
}
