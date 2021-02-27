import UIKit

protocol FactoryProtocol {
    associatedtype ObjectType: Decodable
    func build() -> ObjectType?
}

extension FactoryProtocol {
    func decode(from file: String) -> ObjectType? {
        return MockHelper.decode(from: file)
    }
}
