import UIKit

protocol Keyboardable: class {
    var notificationCenter: NotificationCenterType { get set }

    func addKeyboardObservers()
    func removeKeyboardObservers()
    func didUpdateKeyboard(height: CGFloat)
}

extension Keyboardable {
    func addKeyboardObservers() {
        _ = notificationCenter.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                           object: nil,
                                           queue: nil) { [weak self] notification in
            self?.keyboardWillShow(notification: notification)
        }

        _ = notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                           object: nil,
                                           queue: nil) { [weak self] _ in
            self?.keyboardWillHide()
        }
    }

    func removeKeyboardObservers() {
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func keyboardWillShow(notification: Notification) {
        guard
            let info = notification.userInfo,
            let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }

        didUpdateKeyboard(height: keyboardFrame.height)
    }

    private func keyboardWillHide() {
        didUpdateKeyboard(height: 0)
    }
}
