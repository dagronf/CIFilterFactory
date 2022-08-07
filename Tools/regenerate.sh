#!/bin/sh

# A simple script to re-generate the CIFilterFactory.swift file

# swift ./generate.swift ../Sources/CIFilterFactory

pushd .
cd generator
xcodebuild -scheme ciff_generator build CONFIGURATION_BUILD_DIR="build"
./build/ciff_generator ../../Sources/CIFilterFactory
cd ..

# Comment the next line if you don't want the files formatted automatically
swiftformat --indent tabs --swiftversion 5 --self insert ../Sources/CIFilterFactory/generated/*.swift

# Make the docs
./make-docs.sh
