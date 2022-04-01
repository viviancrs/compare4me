import UIKit
@testable import Compare4Me

class CompareUSDInputDelegateMock: CompareUSDInputDelegate {
    @Spy var invokedShowResult: CompareUSD?

    func showResult(from data: CompareUSD) {
        invokedShowResult = data
    }
}
