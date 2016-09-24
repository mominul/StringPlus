/// Internal Helper structure
internal struct StringPlus {
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

  func substring(start from: Int, end to: Int) -> String {
    var array: [Character] = []

    precondition(to > from)

    for index in from...to {
      array.append(_ary[index])
    }

    return String(array)
  }
}

public extension String {
  public var length: Int {
    return self.characters.count
  }

  public subscript(at: Int) -> Character {
    get {
      let str = StringPlus(string: self)
      return str[at]
    }

    set {
      var str = StringPlus(string: self)
      str[at] = newValue
      self = str.string
    }
  }

  public func at(_ index: Int) -> Character {
    let str = StringPlus(string: self)
    return str[index]
  }

  /// Mark: Creating Sub-Strings

  public func substring(start from: Int, end to: Int) -> String {
    let s = StringPlus(string: self)
    return s.substring(start: from, end: to)
  }

  public func left(count: Int) -> String {
    precondition(!(count > self.characters.count))
    let s = StringPlus(string: self)
    return s.substring(start: 0, end: count - 1)
  }
}
