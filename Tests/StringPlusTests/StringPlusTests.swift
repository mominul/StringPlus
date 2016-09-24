import XCTest
@testable import StringPlus

class StringPlusTests: XCTestCase {
    func testAt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
      let country = "Bangladesh"

      XCTAssertEqual(country.substring(start: 0, end: 5), "Bangla")
      XCTAssertEqual(country.left(count: 6), "Bangla")
    }


    static var allTests : [(String, (StringPlusTests) -> () throws -> Void)] {
        return [
            ("testAt", testAt),
            ("testString", testString),
            ("testSubstring", testSubstring),
        ]
    }
}
