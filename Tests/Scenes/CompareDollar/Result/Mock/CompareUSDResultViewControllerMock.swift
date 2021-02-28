@testable import Compare4Me

class CompareUSDResultViewControllerMock: CompareUSDResultViewControllerType {

    @Spy var invokedShow: CompareUSDResultViewModel?
    @Spy var invokedShowError: String?
    @Spy var invokedShowResult: CompareUSD?

    func show(viewModel: CompareUSDResultViewModel) {
        invokedShow = viewModel
    }
}
