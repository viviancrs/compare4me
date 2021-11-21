import UIKit
@testable import Compare4Me

class NotificationCenterMock: NSObject, NotificationCenterType {

    @Spy var invokedAddObserver: (name: NSNotification.Name?, block: (Notification) -> Void)?
    @Spy var invokedRemoveObserver: NSNotification.Name?

    func addObserver(forName name: NSNotification.Name?,
                     object obj: Any?, queue: OperationQueue?,
                     using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        invokedAddObserver = (name: name, block: block)
        return self
    }

    func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        invokedRemoveObserver = aName
    }
}
