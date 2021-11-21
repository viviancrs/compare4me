import Foundation

protocol NotificationCenterType {
    func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?)
    func addObserver(forName name: NSNotification.Name?,
                     object obj: Any?,
                     queue: OperationQueue?,
                     using block: @escaping (Notification) -> Void) -> NSObjectProtocol
}

extension NotificationCenter: NotificationCenterType {}
