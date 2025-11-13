#!/bin/bash

# Build script for Jenkins CI/CD pipeline
# Runs tests and validates the Python3Python3 code

set -e  # Exit on any error

echo "========================================="
echo "Starting Build Process"
echo "========================================="

# Check if Python3Python3 is installed
echo "Checking Python3Python3 installation..."
Python3 --version

# Run unit tests
echo ""
echo "Running unit tests..."
Python3 -m pytest test_calculator.py -v || Python3 -m unittest test_calculator.py -v

# Run the calculator script
echo ""
echo "Running calculator script..."
Python3 calculator.py

echo ""
echo "========================================="
echo "Build completed successfully!"
echo "========================================="
