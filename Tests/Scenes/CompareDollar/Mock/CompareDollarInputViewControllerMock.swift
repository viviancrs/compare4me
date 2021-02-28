@testable import Compare4Me

class CompareDollarInputViewControllerMock: CompareDollarInputViewControllerType {
    @Spy var invokedShow: CompareDollarInputViewModel?
    @Spy var invokedShowError: String?
    @Spy var invokedShowResult: CompareDollar?

    func show(viewModel: CompareDollarInputViewModel) {
        invokedShow = viewModel
    }

    func showError(_ error: String) {
        invokedShowError = error
    }

    func showResult(from data: CompareDollar) {
        invokedShowResult = data
    }
}
