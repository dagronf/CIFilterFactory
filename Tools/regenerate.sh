#!/bin/sh

# A simple script to re-generate the CIFilterFactory.swift file

swift ./generate.swift > ../Sources/CIFilterFactory/CIFilterFactory.swift
