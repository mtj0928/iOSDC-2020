func piyo(_ num: Int, string: String) {
    let indent = String(repeating: " ", count: num)
    let index = string.index(string.startIndex, offsetBy: num)
    print("\(indent)\(string[index])")
}
