#!/bin/sh

# A simple script to re-generate the CIFilterFactory.swift file

swift ./generate.swift ../Sources/CIFilterFactory

# Comment the next line if you don't want the files formatted automatically
swiftformat --indent tab --tabwidth 3 --swiftversion 5 --self insert ../Sources/CIFilterFactory/CIFilterFactory.swift ../Sources/CIFilterFactory/generated/*.swift
