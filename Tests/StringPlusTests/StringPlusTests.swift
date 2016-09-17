import XCTest
@testable import StringPlus

class StringPlusTests: XCTestCase {
    func testAt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let str = StringPlus(string: "Hello")
        XCTAssertEqual(str[0], "H")
        XCTAssertEqual(str.at(4), "o")
    }

    func testString() {
      let str = StringPlus(string: "World")
      XCTAssertEqual(str.string, String("World"))
    }


    static var allTests : [(String, (StringPlusTests) -> () throws -> Void)] {
        return [
            ("testAt", testAt),
            ("testString", testString),
        ]
    }
}
