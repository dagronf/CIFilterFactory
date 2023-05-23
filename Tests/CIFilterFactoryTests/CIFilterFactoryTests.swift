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
		let sepiaFilter = CIFF.SepiaTone(inputImage: CIImage(), intensity: 0.5)
		XCTAssertNotNil(sepiaFilter)

		XCTAssertEqual(0.5, sepiaFilter!.intensity)


		let sepiaFilter2 = CIFF.SepiaTone()
		XCTAssertNotNil(sepiaFilter2)
		XCTAssertEqual(1.0, sepiaFilter2!.intensity)
	}

	@available(tvOS 13, iOS 13, *)
	func testSimpleBool() {
		// verify casting between bool and nsnumber works correctly
		let f = CIFF.KMeans()!
		f.perceptual = true
		XCTAssertEqual(true, f.perceptual)
		f.perceptual = false
		XCTAssertEqual(false, f.perceptual)
	}

	@available(tvOS 13, iOS 13, *)
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

	func testQRCodeAdditionalOutputAccess() throws {
		try autoreleasepool {
			let c = try XCTUnwrap(CIFF.QRCodeGenerator(text: "hello"))
			let cgimage = c.outputCGImage?.takeUnretainedValue()
			XCTAssertNotNil(cgimage)
		}
	}

	func testBoundsCheck() throws {
		do {
			// Check lower bounds only
			let t = try XCTUnwrap(CIFF.BarsSwipeTransition())
			t.width = -2
			XCTAssertEqual(CIFF.BarsSwipeTransition.widthRange.lowerBound, t.width)

			t.width = -0.001
			XCTAssertEqual(CIFF.BarsSwipeTransition.widthRange.lowerBound, t.width)

			t.width = 100000
			XCTAssertEqual(100000, t.width)
		}

		do {
			// Check upper/lower bounds
			let t = try XCTUnwrap(CIFF.AccordionFoldTransition())
			t.time = -1
			XCTAssertEqual(CIFF.AccordionFoldTransition.timeRange.lowerBound, t.time)
			t.time = 1.1
			XCTAssertEqual(CIFF.AccordionFoldTransition.timeRange.upperBound, t.time)
		}
	}

	func testChain() throws {
		do {
			let testImage = try XCTUnwrap(Bundle.module.url(forResource: "test", withExtension: "jpg"))
			let input = try XCTUnwrap(CIImage(contentsOf: testImage))

			let blur = CIFF.BoxBlur()!
			blur.radius = 10

			let sepia = CIFF.SepiaTone()!

			let crop = CIFF.Crop()!
			crop.rectangle = CGRect(x: 0, y: input.extent.height / 2.0, width: input.extent.width, height: input.extent.height / 2.0)

			let output = try XCTUnwrap(input.applying([blur, sepia, crop]))

			let outputImage = try XCTUnwrap(output.asCGImage())
			Swift.print(outputImage)
		}
	}

	func testChainable() throws {
		let testImage = try XCTUnwrap(Bundle.module.url(forResource: "test", withExtension: "jpg"))
		let input = try XCTUnwrap(CIImage(contentsOf: testImage))

		let output = input
			.applyingBoxBlur()
			.applyingSepiaTone()
			.applyingLineScreen()

		let outputImage = try XCTUnwrap(output.asCGImage())
		Swift.print(outputImage)
	}
}
