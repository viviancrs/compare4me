import UIKit
@testable import Compare4Me

class CompareUSDInputViewMock: UIView, CompareUSDInputViewType {
    var didTapCompareBlock: BlockValues?

    @Spy var invokedShow: CompareUSDInputViewModel?

    func show(viewModel: CompareUSDInputViewModel) {
        invokedShow = viewModel
    }
}
