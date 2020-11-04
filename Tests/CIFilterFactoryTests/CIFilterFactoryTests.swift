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
		let sepiaFilter = CIFilterFactory.CISepiaTone(inputImage: CIImage(), inputIntensity: 0.5)
		XCTAssertNotNil(sepiaFilter)

		XCTAssertEqual(0.5, sepiaFilter!.inputIntensity)


		let sepiaFilter2 = CIFilter.SepiaTone()
		XCTAssertNotNil(sepiaFilter2)
		XCTAssertEqual(0.5, sepiaFilter2!.inputIntensity)
	}
}
