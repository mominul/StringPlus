/*
  StringPlus

  Copyright (C) 2016-present StringPlus Authors

  Authors:
    Muhammad Mominul Huque
  References:
    http://stackoverflow.com/a/26775912
*/

public extension String {
  public var length: Int {
    return self.characters.count
  }

  /// Mark: URL and Path Related

  public var isUrl: Bool {
    return has(prefix: "http:") || has(prefix: "https:") || has(prefix: "ftp:") ||
            has(prefix: "irc:") || has(prefix: "file:") || has(prefix: "mailto:") ||
            has(prefix: "data:")
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
    let min = index(startIndex, offsetBy: from)
    let max = index(startIndex, offsetBy: to)
    return self[min...max]
  }

  public func substring(start: Int, length: Int) -> String {
    let startIdx = index(startIndex, offsetBy: start)
    let endIdx = index(startIdx, offsetBy: length-1)
    return self[startIdx...endIdx]
  }

  public func left(count: Int) -> String {
    precondition(!(count > self.characters.count))
    return String(characters.prefix(count))
  }

  public func right(count: Int) -> String {
    precondition(!(count > self.characters.count))
    return String(characters.suffix(count))
  }

  public func has(suffix: String) -> Bool {
    if !(suffix.length > self.length) {
      return right(count: suffix.length) == suffix ? true : false
    }
    return false
  }

  public func has(prefix: String) -> Bool {
    if !(prefix.length > self.length) {
      return left(count: prefix.length) == prefix ? true : false
    }
    return false
  }

  public func simplified() -> String {
    let trimmingChars: [Character] = [" ", "\n", "\t", "\r", "\r\n", "\u{2028}", "\u{2029}"]

    let chars = characters.filter { element in
      !trimmingChars.contains { $0 == element }
    }

    return String(chars)
  }

  public func trimmingCharacters(in trimmingChars: [Character]) -> String {
    let chars = characters.filter { element in
      !trimmingChars.contains { $0 == element }
    }

    return String(chars)
  }
}
