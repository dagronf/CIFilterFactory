import XCTest
@testable import CIFilterFactory

final class CIFilterFactoryTests: XCTestCase {
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        XCTAssertEqual(CIFilterFactory().text, "Hello, World!")
//    }
//
//    static var allTests = [
//        ("testExample", testExample),
//    ]

	func testExample() {
		let sepiaFilter = CIFF.SepiaTone(image: CIImage(), intensity: 0.5)
		XCTAssertNotNil(sepiaFilter)

		XCTAssertEqual(0.5, sepiaFilter!.intensity)


		let sepiaFilter2 = CIFF.SepiaTone()
		XCTAssertNotNil(sepiaFilter2)
		XCTAssertEqual(1.0, sepiaFilter2!.intensity)
	}
}
