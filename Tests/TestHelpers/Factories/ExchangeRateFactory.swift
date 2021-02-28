import Foundation
@testable import Compare4Me

struct ExchangeRateFactory: FactoryProtocol {
    func build() -> ExchangeRate? {
        return decode(from: "ExchangeRate")
    }
}
