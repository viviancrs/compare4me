@testable import Compare4Me

class CompareUSDInputViewControllerMock: CompareUSDInputViewControllerType {
    @Spy var invokedShow: CompareUSDInputViewModel?
    @Spy var invokedShowError: String?
    @Spy var invokedShowResult: CompareUSD?

    func show(viewModel: CompareUSDInputViewModel) {
        invokedShow = viewModel
    }

    func showError(_ error: String) {
        invokedShowError = error
    }

    func showResult(from data: CompareUSD) {
        invokedShowResult = data
    }
}
