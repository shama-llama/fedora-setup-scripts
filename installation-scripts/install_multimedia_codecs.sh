#!/bin/bash

echo "Starting multimedia support configuration..."

# Swap ffmpeg-free with ffmpeg
echo "Swapping ffmpeg-free with ffmpeg..."
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

# Update multimedia packages
echo "Updating multimedia packages..."
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

echo "Multimedia support configuration completed successfully!"
