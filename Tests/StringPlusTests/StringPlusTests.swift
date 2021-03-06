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

    func testSubstring() {
      XCTAssertEqual("Bangladesh".substring(start: 0, end: 5), "Bangla")
      XCTAssertEqual("Bangladesh".substring(start: 3, length: 4), "glad")
      XCTAssertEqual("Bangladesh".left(count: 6), "Bangla")
      XCTAssertEqual("Swift".right(count: 2), "ft")
    }

    func testLength() {
      XCTAssertEqual("Cricket".length, 7)
    }

    func testHas() {
      XCTAssertTrue("Café du Monde".has(prefix: "Café"))
      XCTAssertFalse("Ca".has(prefix: "ca"))
      XCTAssertFalse("Ca".has(prefix: "Café"))

      XCTAssertTrue("Let's meet at the café".has(suffix: "fé"))
      XCTAssertFalse("fe".has(suffix: "fé"))
      XCTAssertFalse("é".has(suffix: "fé"))
    }

    func testTrimming() {
      XCTAssertEqual("  lots\t of\nwhitespace\r\n ".simplified(), "lotsofwhitespace")
      XCTAssertEqual("/ubuntu-14.04/".trimmingCharacters(in: ["/", "-", "."]), "ubuntu1404")
    }

    func testUrlAndPath() {
      XCTAssertTrue("https://swift.org".isUrl)
      XCTAssertFalse("/home/".isUrl)

      XCTAssertEqual("/home".addingPath("source"), "/home/source")
      XCTAssertEqual("/usr/".addingPath("/bin"), "/usr/bin")
      XCTAssertEqual("/bin".addingPath("/curl"), "/bin/curl")

      XCTAssertEqual("/usr/bin/".deletingLastPathComponent, "/usr/")
      XCTAssertEqual("/usr/bin".deletingLastPathComponent, "/usr/")
      XCTAssertEqual("/".deletingLastPathComponent, "/")
    }


    static var allTests : [(String, (StringPlusTests) -> () throws -> Void)] {
        return [
            ("testAt", testAt),
            ("testSubstring", testSubstring),
            ("testLength", testLength),
            ("testHas", testHas),
            ("testTrimming", testTrimming),
            ("testUrlAndPath", testUrlAndPath),
        ]
    }
}
