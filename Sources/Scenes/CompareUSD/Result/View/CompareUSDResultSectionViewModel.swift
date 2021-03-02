struct CompareUSDResultSectionViewModel: Equatable {
    let title: String
    let items: [Item]
}

extension CompareUSDResultSectionViewModel {
    struct Item: Equatable {
        let title: String
        let value: String?
    }
}
