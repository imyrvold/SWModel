import XCTest
@testable import SWModel

final class SWModelTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SWModel().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
