#!/bin/bash

# Check if root privileges are required
if [[ $EUID -ne 0 ]]; then
  echo "Please run this script as root or with sudo privileges."
  exit 1
fi

# Update package lists
echo "Updating package lists..."
pkg update

# Install dependencies
echo "Installing dependencies..."
pkg install imagemagick git nodejs ffmpeg libwebp mc nano yarn

# Remove temporary files
echo "Removing temporary files..."
rm -rf session.json

# Remove existing node_modules directory if present
if [ -d "node_modules" ]; then
  echo "Removing existing node_modules directory..."
  rm -rf node_modules
fi

# Install project dependencies using yarn
echo "Installing project dependencies using yarn..."
yarn install

# Start the application
echo "Starting the application..."
npm start

# Display success message
echo "Yaka MD and all of its dependencies are installed successfully!"
