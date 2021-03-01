@testable import Compare4Me

class CompareUSDInputPresenterMock: CompareUSDInputPresenterType {
    @Spy var invokedCompare: (usdValue: Double, brlValue: Double)?

    var viewController: CompareUSDInputViewControllerType?

    func compare(usdValue: Double, brlValue: Double) {
        invokedCompare = (usdValue, brlValue)
    }
}
