#!/bin/bash
set -e  # Exit on error

echo "Installing Python dependencies..."
pip install --no-cache-dir -r requirements.txt
pip install --upgrade pip