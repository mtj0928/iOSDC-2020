func fuga(_ text: String) {
    if !text.isEmpty {
        let count = text.count
        (0..<count).forEach { i in
            let indent = String(repeating: " ", count: i)
            let index = text.index(text.startIndex, offsetBy: i)
            print("\(indent)\(text[index])")
        }
    }
}
