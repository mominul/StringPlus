struct StringPlus {
  internal var _str: String
  internal var _ary: [Character] = []

  init(string: String) {
    _str = string

    validate()
  }

  internal mutating func validate() {

    guard !_str.isEmpty else {
      return
    }

    if !_ary.isEmpty {
      _ary.removeAll()
    }

    for char in _str.characters {
      _ary.append(char)
    }
  }

  var string: String {
    return _str
  }

  subscript(at: Int) -> Character {
    return _ary[at]
  }

  func at(_ index: Int) -> Character {
    return _ary[index]
  }
}
