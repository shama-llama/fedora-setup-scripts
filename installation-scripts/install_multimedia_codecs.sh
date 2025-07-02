#!/bin/bash

echo "Starting multimedia support configuration..."

sudo dnf group install Multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf install intel-media-driver

echo "Multimedia support configuration completed successfully!"
