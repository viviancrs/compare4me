import UIKit
@testable import Compare4Me

class CompareUSDResultViewMock: UIView, CompareUSDResultViewType {
    @Spy var invokedShow: CompareUSDResultViewModel?

    func show(viewModel: CompareUSDResultViewModel) {
        invokedShow = viewModel
    }
}
