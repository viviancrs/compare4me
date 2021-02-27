import Foundation

class MockHelper {
    static func decode<T: Decodable>(from file: String) -> T? {
        guard let data = Data.load(from: file) else {
            return nil
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(T.self, from: data)
    }
}
