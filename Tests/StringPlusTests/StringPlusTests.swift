import XCTest
@testable import StringPlus

class StringPlusTests: XCTestCase {
    func testAt() {
        let str = "Hello"
        XCTAssertEqual(str[0], "H")
        XCTAssertEqual(str.at(4), "o")
        // Replace a Character
        var wrong = "Heelo"
        wrong[2] = "l"
        XCTAssertEqual(wrong, "Hello")
    }

    func testString() {
      let str = StringPlus(string: "World")
      XCTAssertEqual(str.string, String("World"))
    }

    func testSubstring() {
      XCTAssertEqual("Bangladesh".substring(start: 0, end: 5), "Bangla")
      XCTAssertEqual("Bangladesh".substring(start: 3, length: 4), "glad")
      XCTAssertEqual("Bangladesh".left(count: 6), "Bangla")
      XCTAssertEqual("Swift".right(count: 2), "ft")
    }

    func testLength() {
      XCTAssertEqual("Cricket".length, 7)
    }


    static var allTests : [(String, (StringPlusTests) -> () throws -> Void)] {
        return [
            ("testAt", testAt),
            ("testString", testString),
            ("testSubstring", testSubstring),
            ("testLength", testLength),
        ]
    }
}
