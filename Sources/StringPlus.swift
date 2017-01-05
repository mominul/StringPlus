/*
  StringPlus

  Copyright (C) 2016-present StringPlus Authors

  Authors:
    Muhammad Mominul Huque
  References:
    http://stackoverflow.com/a/26775912
*/

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

  internal var string: String {
    return _str
  }

  internal subscript(at: Int) -> Character {
    get {
      return _ary[at]
    }

    set {
      _ary[at] = newValue
      _str = String(_ary)
    }
  }

  internal func at(_ index: Int) -> Character {
    return _ary[index]
  }

  internal func substring(start from: Int, end to: Int) -> String {
    var array: [Character] = []

    precondition(to > from)

    for index in from...to {
      array.append(_ary[index])
    }

    return String(array)
  }

  internal func substring(start: Int, length: Int) -> String {
    var array = Array(_ary.dropFirst(start))
    var stringArray: [Character] = []

    for index in 0...(length - 1) {
      stringArray.append(array[index])
    }

    return String(stringArray)
  }
}

public extension String {
  public var length: Int {
    return self.characters.count
  }

  /// Mark: Characters at a random place

  public subscript(at: Int) -> Character {
    get {
      return self[self.index(startIndex, offsetBy: at)]
    }

    set {
      let idx = index(startIndex, offsetBy: at)
      remove(at: idx)
      insert(newValue, at: idx)
    }
  }

  public func at(_ index: Int) -> Character {
    return self[index]
  }

  /// Mark: Creating Sub-Strings

  public func substring(start from: Int, end to: Int) -> String {
    let s = StringPlus(string: self)
    return s.substring(start: from, end: to)
  }

  public func substring(start: Int, length: Int) -> String {
    let s = StringPlus(string: self)
    return s.substring(start: start, length: length)
  }

  public func left(count: Int) -> String {
    precondition(!(count > self.characters.count))
    let s = StringPlus(string: self)
    return s.substring(start: 0, end: count - 1)
  }
}
