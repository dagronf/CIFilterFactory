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

	@available(iOS 13, *)
	func testSimpleBool() {
		// verify casting between bool and nsnumber works correctly
		let f = CIFF.KMeans()!
		f.perceptual = true
		XCTAssertEqual(true, f.perceptual)
		f.perceptual = false
		XCTAssertEqual(false, f.perceptual)
	}

	@available(iOS 13, *)
	func testSimpleIntCheck() {
		// verify casting between int and nsnumber works correctly
		let f = CIFF.MorphologyRectangleMinimum()!
		f.width = 1
		XCTAssertEqual(1, f.width)
		f.width = 88
		XCTAssertEqual(88, f.width)
		f.width = 1024
		XCTAssertEqual(1024, f.width)
	}

	func testSimpleTimeCheck() {
		// verify casting between double and nsnumber works correctly
		let f = CIFF.BarsSwipeTransition()!
		f.time = 0
		XCTAssertEqual(0.0, f.time)
		f.time = 0.24
		XCTAssertEqual(0.24, f.time)
		f.time = 0.99
		XCTAssertEqual(0.99, f.time)
		f.time = 1
		XCTAssertEqual(1, f.time)
	}

	func testSimpleCountCheck() {
		// verify casting between double and nsnumber works correctly
		let f = CIFF.ColorCube()!
		f.cubeDimension = 0
		XCTAssertNotEqual(0, f.cubeDimension)  // due to clamping, value will be 2
		XCTAssertEqual(2, f.cubeDimension)     // clamped value
		f.cubeDimension = 4
		XCTAssertEqual(4, f.cubeDimension)
		f.cubeDimension = 66
		XCTAssertEqual(66, f.cubeDimension)
		f.cubeDimension = 19
		XCTAssertEqual(19, f.cubeDimension)
	}
}
