import Quick
import Nimble
@testable import Compare4Me

class KeyboardableTests: QuickSpec {
    override func spec() {
        var sut: KeyboardableObject!
        var mockNotificationCenter: NotificationCenterMock!

        beforeEach {
            mockNotificationCenter = NotificationCenterMock()
            sut = KeyboardableObject(notificationCenter: mockNotificationCenter)
        }

        describe("#addKeyboardObservers") {
            beforeEach {
                sut.addKeyboardObservers()
            }

            it("calls notification center's addObserver") {
                let historyInvokedAddObserver = mockNotificationCenter.$invokedAddObserver.history
                expect(historyInvokedAddObserver[0]?.name).to(equal(UIResponder.keyboardWillShowNotification))
                expect(historyInvokedAddObserver[1]?.name).to(equal(UIResponder.keyboardWillHideNotification))
                expect(historyInvokedAddObserver.count).to(equal(2))
            }

            it("binds keyboard will show with didUpdateKeyboard") {
                let height: CGFloat = 100.0
                let userInfo = [UIResponder.keyboardFrameEndUserInfoKey: CGRect(x: 0, y: 0, width: 0, height: height)]
                let notification = Notification(name: UIResponder.keyboardWillShowNotification,
                                                object: nil,
                                                userInfo: userInfo)

                let willShowNotification = mockNotificationCenter.$invokedAddObserver.history[0]
                willShowNotification?.block(notification)

                expect(sut.invokedDidUpdateKeyboard).to(equal(height))
                expect(sut.$invokedDidUpdateKeyboard.count).to(equal(1))
            }

            it("binds keyboard will hide with didUpdateKeyboard") {
                let height: CGFloat = 0.0
                let notification = Notification(name: UIResponder.keyboardWillHideNotification)

                let willHideNotification = mockNotificationCenter.$invokedAddObserver.history[1]
                willHideNotification?.block(notification)

                expect(sut.invokedDidUpdateKeyboard).to(equal(height))
                expect(sut.$invokedDidUpdateKeyboard.count).to(equal(1))
            }
        }

        describe("#removeKeyboardObservers") {
            beforeEach {
                sut.removeKeyboardObservers()
            }

            it("calls notification center's removeObserver") {
                let historyInvokedRemoveObserver = mockNotificationCenter.$invokedRemoveObserver.history
                expect(historyInvokedRemoveObserver[0]).to(equal(UIResponder.keyboardWillShowNotification))
                expect(historyInvokedRemoveObserver[1]).to(equal(UIResponder.keyboardWillHideNotification))
                expect(historyInvokedRemoveObserver.count).to(equal(2))
            }
        }
    }

    class KeyboardableObject: Keyboardable {
        var notificationCenter: NotificationCenterType
        @Spy var invokedDidUpdateKeyboard: CGFloat?

        init(notificationCenter: NotificationCenterType) {
            self.notificationCenter = notificationCenter
        }

        func didUpdateKeyboard(height: CGFloat) {
            invokedDidUpdateKeyboard = height
        }
    }
}
