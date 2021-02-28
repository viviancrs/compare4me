struct CompareUSDResultViewModel {
    let valuesInBrasil: ValuesInBrazil
    let importValues: ImportValues
}

extension CompareUSDResultViewModel {
    struct ValuesInBrazil {
        private (set) var totalInBRL: String = ""
        private (set) var usdByBRL: String = ""
    }

    struct ImportValues {
        private (set) var totalInBRL: String = ""
        private (set) var usdByBRL: String = ""

        private (set) var usdExchangeRate: String = ""
        private (set) var iof: String = ""
        private (set) var tax: String = ""
    }
}
