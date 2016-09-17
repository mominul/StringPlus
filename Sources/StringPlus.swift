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

    if _ary.isEmpty {
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
    get {
      return _ary[at]
    }

    set {
      _ary[at] = newValue
      _str = String(_ary)
    }
  }

  func at(_ index: Int) -> Character {
    return _ary[index]
  }

  mutating func append(_ str: String) {
    _str.append(str)
    validate()
  }

  mutating func append(_ c: Character) {
    _str.append(c)
    validate()
  }
}
