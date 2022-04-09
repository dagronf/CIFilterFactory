//
//  InputKeyType.swift
//  ciff_generator
//
//  Created by Darren Ford on 9/4/2022.
//

import Foundation
import CoreImage

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
		return mappedClass ?? keyClass
	}

	var swiftType: String {
		if self.subtype == "CIAttributeTypePosition" {
			return "CGPoint"
		}
		else if subtype == "CIAttributeTypeRectangle" {
			return "CGRect"
		}
		else if subtype == "CIAttributeTypeOffset" {
			return "CGPoint"
		}
		else if self.class == "NSAffineTransform" {
			return "CIAffineTransform"
		}
		else if self.class == "CGImageMetadataRef" {
			return "CGImageMetadata"
		}
		else if subtype == kCIAttributeTypeScalar {
			return "Double"
		}
		else if subtype == kCIAttributeTypeDistance {
			return "Double"
		}
		else if subtype == kCIAttributeTypeTime {
			return "Double"
		}
		else if subtype == kCIAttributeTypeAngle {
			return "Double"
		}
		else if subtype == kCIAttributeTypeInteger {
			return "Int"
		}
		else if subtype == kCIAttributeTypeBoolean {
			return "Bool"
		}
		else if subtype == kCIAttributeTypeCount {
			return "UInt"
		}
		return self.`class`
	}

	func valueType(keyAttributes: [String : Any]) -> CoreType {
		let type = self.swiftType
		if type == "Double" {
			return DoubleGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "Int" {
			return IntGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "UInt" {
			return UIntGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "Bool" {
			return BoolGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "CGRect" {
			return RectGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "CGPoint" {
			return PositionGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "CIAffineTransform" {
			return AffineGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}
		if type == "CGImageMetadata" {
			return ImageGeneratorType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
		}

		return CoreType(key: attributeKey, keyAttributes: keyAttributes, inputKeyType: self)
	}
}
