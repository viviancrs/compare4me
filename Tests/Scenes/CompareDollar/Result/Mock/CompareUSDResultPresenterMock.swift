@testable import Compare4Me

class CompareUSDResultPresenterMock: CompareUSDResultPresenterType {
    var viewController: CompareUSDResultViewControllerType?
    @Spy var invokedViewDidLoad: Bool?

    func viewDidLoad() {
        invokedViewDidLoad = true
    }
}
