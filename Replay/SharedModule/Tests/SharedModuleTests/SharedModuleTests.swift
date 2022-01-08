import XCTest
@testable import SharedModule

final class SharedModuleTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SharedModule().text, "Hello, World!")
    }
}
