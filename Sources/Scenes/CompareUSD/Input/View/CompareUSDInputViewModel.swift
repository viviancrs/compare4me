struct CompareUSDInputViewModel: Equatable {
    private(set) var isButtonLoading: Bool = false

    func with(isButtonLoading: Bool) -> Self {
        var viewModel = self
        viewModel.isButtonLoading = isButtonLoading
        return viewModel
    }
}
