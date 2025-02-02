#!/bin/bash

# Function to check and install a package
install_package() {
  local package=$1
  if ! rpm -q "$package" &> /dev/null; then
    echo "Installing $package with dnf..."
    sudo dnf install -y "$package"
  else
    echo "$package is already installed."
  fi
}

# Function to check and install a group
install_group() {
  local group=$1
  echo "Installing group: $group..."
  sudo dnf group install -y "$group"
}

# Function to configure the Visual Studio Code repository and install it
install_vscode() {
  echo "Importing Microsoft's GPG key..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

  if [ $? -eq 0 ]; then
    echo "Microsoft's GPG key imported successfully."
  else
    echo "Failed to import Microsoft's GPG key. Exiting."
    exit 1
  fi

  echo "Adding Visual Studio Code repository..."
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

  if [ $? -eq 0 ]; then
    echo "Visual Studio Code repository added successfully."
  else
    echo "Failed to add Visual Studio Code repository. Exiting."
    exit 1
  fi

  echo "Checking for package updates..."
  sudo dnf check-update

  echo "Installing Visual Studio Code..."
  sudo dnf install -y code

  if [ $? -eq 0 ]; then
    echo "Visual Studio Code installed successfully!"
  else
    echo "Failed to install Visual Studio Code. Exiting."
    exit 1
  fi
}

# Main script execution
echo "Updating package repositories with dnf..."
sudo dnf update -y

echo "Installing terminal tools..."
install_package bat
install_package btop
install_package cpufetch
install_package fastfetch
install_package lsd
install_package ncdu

echo "Installing language support..."
install_group python-classroom
install_group python-science
install_group ruby
install_group rubyonrails
install_group c-development
install_group java
install_group java-development
install_group javaenterprise
install_group php
install_group perl
install_group perl-web
install_group haskell

echo "Installing database support..."
install_group sql-server
install_group mysql

echo "Installing browsers..."
install_package chromium
install_package torbrowser-launcher

echo "Installing development tools..."
install_package kate
install_package octave
install_group virtualization --with-optional
install_vscode

echo "Installing graphics applications..."
install_package blender
install_package gimp
install_package inkscape
install_package krita

echo "Installing multimedia tools..."
install_package audacity
install_package handbrake-gui
install_package kdenlive
install_package mkvtoolnix-gui
install_package obs-studio

echo "Installing multimedia players..."
install_package mpv
install_group vlc

echo "Installing social media applications..."
install_package discord
install_package telegram-desktop

echo "Installing library applications..."
install_package calibre

echo "All requested applications and tools have been installed successfully!"
