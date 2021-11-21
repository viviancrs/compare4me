struct CompareUSDInputViewModel: Equatable {
    private(set) var isButtonLoading: Bool = false
    private(set) var usdValueHasError: Bool = false
    private(set) var brlValueHasError: Bool = false

    func with(isButtonLoading: Bool) -> Self {
        var viewModel = self
        viewModel.isButtonLoading = isButtonLoading
        return viewModel
    }

    func with(usdValueHasError: Bool) -> Self {
        var viewModel = self
        viewModel.usdValueHasError = usdValueHasError
        return viewModel
    }

    func with(brlValueHasError: Bool) -> Self {
        var viewModel = self
        viewModel.brlValueHasError = brlValueHasError
        return viewModel
    }
}
