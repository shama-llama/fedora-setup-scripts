#!/bin/bash

echo "Enabling RPM Fusion repositories..."

# Install RPM Fusion Free and Non-Free repositories
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Check if RPM Fusion installation was successful
if [ $? -eq 0 ]; then
  echo "RPM Fusion repositories enabled successfully."
else
  echo "Failed to enable RPM Fusion repositories. Exiting."
  exit 1
fi

echo "Configuring the fedora-cisco-openh264 repository..."

# Enable the fedora-cisco-openh264 repository
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Check if the configuration was successful
if [ $? -eq 0 ]; then
  echo "fedora-cisco-openh264 repository configured successfully."
else
  echo "Failed to configure the fedora-cisco-openh264 repository. Exiting."
  exit 1
fi

echo "Updating the core package group..."

# Update the @core group
sudo dnf update -y @core

echo "All configurations completed successfully!"
