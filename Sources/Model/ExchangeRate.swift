struct ExchangeRate: Equatable, Decodable {
    let bid: String

    init(bid: String) {
        self.bid = bid
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerKey.self)
        let symbolContainer = try container.nestedContainer(keyedBy: SymbolKey.self, forKey: .symbol)
        self.bid = try symbolContainer.decode(String.self, forKey: .bid)
    }

    enum ContainerKey: String, CodingKey {
        case symbol = "USDT"
    }

    enum SymbolKey: String, CodingKey {
        case bid
    }
}

extension ExchangeRate {
    enum Symbol: String, Decodable {
        case usdt = "USDT"
        case brl = "BRL"
    }
}
