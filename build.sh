#!/bin/bash

# Build script for Jenkins CI/CD pipeline
# Runs tests and validates the Python code

set -e  # Exit on any error

echo "========================================="
echo "Starting Build Process"
echo "========================================="

# Check if Python is installed
echo "Checking Python installation..."
python --version

# Run unit tests
echo ""
echo "Running unit tests..."
python -m pytest test_calculator.py -v || python -m unittest test_calculator.py -v

# Run the calculator script
echo ""
echo "Running calculator script..."
python calculator.py

echo ""
echo "========================================="
echo "Build completed successfully!"
echo "========================================="
