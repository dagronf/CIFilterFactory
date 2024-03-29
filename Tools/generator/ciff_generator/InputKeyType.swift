//
//  InputKeyType.swift
//  ciff_generator
//
//  Copyright © 2024 Darren Ford. All rights reserved.
//

import CoreImage
import Foundation

struct InputKeyType {
	let attributeKey: String
	let name: String
	let keyClass: String
	let mappedClass: String?
	let description: String
	let subtype: String?
	let `default`: Any?

	let keyAttributes: [String: Any]

	var `class`: String {
		return self.mappedClass ?? self.keyClass
	}

	// Map between the CIFilter attribute type and the compatible Swift type
	var swiftType: String {
		if self.subtype == kCIAttributeTypePosition {
			return "CGPoint"
		}
		else if self.subtype == kCIAttributeTypeRectangle {
			return "CGRect"
		}
		else if self.subtype == kCIAttributeTypeOffset {
			return "CGPoint"
		}
		else if self.class == "NSAffineTransform" {
			return "CIAffineTransform"
		}
		else if self.class == "CGImageMetadataRef" {
			return "CGImageMetadata"
		}
		else if self.subtype == kCIAttributeTypeScalar {
			return "Double"
		}
		else if self.subtype == kCIAttributeTypeDistance {
			return "Double"
		}
		else if self.subtype == kCIAttributeTypeTime {
			return "Double"
		}
		else if self.subtype == kCIAttributeTypeAngle {
			return "Double"
		}
		else if self.subtype == kCIAttributeTypeInteger {
			return "Int"
		}
		else if self.subtype == kCIAttributeTypeBoolean {
			return "Bool"
		}
		else if self.subtype == kCIAttributeTypeCount {
			return "UInt"
		}
		else if self.subtype == kCIAttributeTypePosition3 {
			return "CIPosition3"
		}
		return self.class
	}

	// Returns a code generator for the specific swift attribute type
	func valueTypeGenerator() -> CoreType {
		switch self.swiftType {
		case "Double": return DoubleGeneratorType(inputKeyType: self)
		case "Int": return IntGeneratorType(inputKeyType: self)
		case "UInt": return UIntGeneratorType(inputKeyType: self)
		case "Bool": return BoolGeneratorType(inputKeyType: self)
		case "CGRect": return RectGeneratorType(inputKeyType: self)
		case "CGPoint": return PositionGeneratorType(inputKeyType: self)
		case "CIAffineTransform": return AffineGeneratorType(inputKeyType: self)
		case "CGImageMetadata": return ImageGeneratorType(inputKeyType: self)
		case "String": return StringGeneratorType(inputKeyType: self)
		case "Data": return DataGeneratorType(inputKeyType: self)
		case "CIPosition3": return CIPosition3Type(inputKeyType: self)
		case "CIVector": return CIVectorGeneratorType(inputKeyType: self)
		default: return CoreType(inputKeyType: self)
		}
	}
}
