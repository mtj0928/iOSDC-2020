func hoge(_ str: String) {
    let count = str.count
    (0..<count).forEach { index in
        let indent = String(repeating: " ", count: index)
        let stringIndex = str.index(str.startIndex, offsetBy: index)
        print("\(indent)\(str[stringIndex])")
    }
}
