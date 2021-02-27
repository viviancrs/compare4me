import Foundation

extension Data {
    static func load(from file: String) -> Data? {
        let bundle = Bundle(for: MockHelper.self)
        guard let url = bundle.url(forResource: file, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return nil
        }

        return data
    }
}
