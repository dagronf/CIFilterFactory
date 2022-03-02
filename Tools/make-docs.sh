#!/bin/sh

# A simple script to generate a docarchive file for cifilterfactory

# Make sure we stop if any errors occur
set -e

# The path where this script resides (<package>/tools folder)
script_path="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# The path for the package (one level up)
package_path="$( cd -- "${script_path}/../" >/dev/null 2>&1 ; pwd -P )"

# The temporary 'docs' folder for generating documentation
temporary_folder="${package_path}/.docgeneratortemp"

echo "Generating docarchive in ${package_path}"
echo "Temporary build location is ${temporary_folder}"

pushd .

# We have to run docbuild in the root of the source package
cd "${package_path}"

# Generate the documentation, using 'docs_path' as the temporary generation folder
echo "Compiling package..."
xcodebuild docbuild -scheme CIFilterFactory -derivedDataPath "${temporary_folder}" -destination "platform=macOS" >/dev/null

echo "Copying docarchive into position..."
# Copy the resulting docarchive file up to the package folder
cp -R "${temporary_folder}/Build/Products/Debug/CIFilterFactory.doccarchive" .

echo "Removing temporary build folder..."
# And remove the temporary docs folder
rm -r "${temporary_folder}"

popd
