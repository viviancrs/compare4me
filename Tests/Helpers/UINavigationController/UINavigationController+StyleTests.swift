import Quick
import Nimble
@testable import Compare4Me

class UINavigationControllerStyleTests: QuickSpec {
    override func spec() {
        var sut: UINavigationController!

        beforeEach {
            sut = UINavigationController()
            sut.pushViewController(UIViewController(), animated: false)
            sut.pushViewController(UIViewController(), animated: false)
        }

        describe("#setTransparentStyle") {
            it("confifures transparent style") {
                sut.setTransparentStyle()

                expect(sut.navigationBar.isTranslucent).to(beTrue())
                expect(sut.navigationBar.tintColor).to(equal(Colors.Neutrals.neutral90))
                expect(sut.navigationBar.topItem?.title).to(equal(""))
            }
        }
    }
}
