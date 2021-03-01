import Quick
import Nimble
import SnapshotTesting
@testable import Compare4Me

class CompareUSDResultViewTests: QuickSpec {
    override func spec() {
        var sut: CompareUSDResultView!

        beforeEach {
            sut = CompareUSDResultView()
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
        }

        describe("#initWithDecode") {
            it("throws fatal error") {
                expect { sut = CompareUSDResultView(coder: NSCoder()) }.to(throwAssertion())
            }
        }

        describe("#show") {
            beforeEach {
                let section = createSectionViewModel()
                let viewModel = CompareUSDResultViewModel(valuesInBrasil: section, importValues: section)
                sut.show(viewModel: viewModel)
            }

            it("has a valid snapshot") {
                assertSnapshot(matching: sut, as: .image)
            }
        }

        func createSectionViewModel() -> CompareUSDResultSectionViewModel {
            var items = [CompareUSDResultSectionViewModel.Item]()
            items.append(.init(title: "This is an item #1", value: "value #1"))
            items.append(.init(title: "This is an item #2", value: "value #2"))
            items.append(.init(title: "This is an item #3", value: "value #3"))

            let viewModel = CompareUSDResultSectionViewModel(title: "This is a title", items: items)
            return viewModel
        }
    }
}
