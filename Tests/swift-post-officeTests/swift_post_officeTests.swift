import XCTest
@testable import swift_post_office

final class swift_post_officeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_post_office().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
