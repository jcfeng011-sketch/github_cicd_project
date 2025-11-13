#!/bin/bash

# Build script for Jenkins CI/CD pipeline
# Runs tests and validates the python3python3 code

set -e  # Exit on any error

echo "========================================="
echo "Starting Build Process"
echo "========================================="

# Check if python3python3 is installed
echo "Checking python3python3 installation..."
python3 --version

# Run unit tests
echo ""
echo "Running unit tests..."
python3 -m pytest test.py -v || python3 -m unittest test.py -v

# Run the calculator script
echo ""
echo "Running calculator script..."
python3 calculator.py

echo ""
echo "========================================="
echo "Build completed successfully!"
echo "========================================="
