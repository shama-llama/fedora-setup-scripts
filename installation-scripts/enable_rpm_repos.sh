#!/bin/bash

# Install RPM Fusion Free and Non-Free repositories
echo "Enabling RPM Fusion repositories..."
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Enable the fedora-cisco-openh264 repository
echo "Configuring the fedora-cisco-openh264 repository..."
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Update the @core group
echo "Updating the core package group..."
sudo dnf update -y @core

echo "All configurations completed successfully!"
