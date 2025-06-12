#!/bin/bash

# ==============================================================================
# Repository and Package Configurations
# ==============================================================================

install_vscode_repo() {
  echo "Installng Visual Studio Code..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
}

install_starship() {
  echo "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh
}

install_graphdb() {
    echo "Installing GraphDB Desktop..."
    sudo dnf install -y https://download.ontotext.com/owlim/0f89dcaa-25d2-11f0-bf83-42843b1b6b38/graphdb-desktop-11.0.1-1.x86_64.rpm
}

neo4j_repo_content="
[neo4j]
name=Neo4j RPM Repository
baseurl=https://yum.neo4j.com/stable/latest
enabled=1
gpgcheck=1"

install_neo4j_repo() {
  echo "Setting up Neo4j repository..."
  sudo rpm --import https://debian.neo4j.com/neotechnology.gpg.key
  echo "$neo4j_repo_content" | sudo tee /etc/yum.repos.d/neo4j.repo > /dev/null
}

# ==============================================================================
# Main Script Execution
# ==============================================================================

# --- System Update and Core Repositories ---
echo "Updating package repositories with dnf..."
sudo dnf update -y
install_vscode_repo
install_neo4j_repo

# --- Desktop Environment and Office Suite ---
echo "Installing core desktop and office packages..."
sudo dnf group install -y \
    kde-desktop \
    kde-apps \
    libreoffice

echo "Installing terminal tools..."
sudo dnf install \
    bat \
    btop \
    cpufetch \
    fastfetch \
    lsd \
    ncdu \
    arp-scan
install_starship

# --- Language Support ---
echo "Installing language support..."
sudo dnf group install -y \
    development-tools \
    c-development \
    python-classroom \
    python-science \
    ruby \
    rubyonrails \
    java \
    java-development \
    javaenterprise \
    php \
    perl \
    perl-web \
    haskell

# --- Databases ---
echo "Installing database tools..."
sudo dnf group install -y  \
    sql-server \
    mysql
sudo dnf install \
    postgresql* \
    postgis \
    neo4j
install_graphdb

# --- Development Tools ---
echo "Installing development tools..."
sudo dnf install \
    gh \
    graphviz \
    libevent-devel \
    tesseract \
    tesseract-langpack* tesseract-script* \
    tesseract-equ tesseract-osd tesseract-tools \
    perl-Image-ExifTool \
    texlive-scheme-full

# --- GIS Tools ---
echo "Installing GIS tools..."
sudo dnf install \
    qgis python3-qgis qgis-grass qgis-server \
    gdal gdal-devel gdal-libs \
    gdal-java gdal-javadoc \
    gdal-python-tools python3-gdal

# --- PDF Tools ---
echo "Installing PDF tools..."
sudo dnf install \
    pdftk \
    qpdf \
    poppler \
    poppler-utils \
    gs

# --- Development Environments ---
echo "Installing development environments..."
sudo dnf install \
    code \
    kate \
    octave \
    godot

# --- Virtualization ---
echo "Installing virtualization tools..."
sudo dnf group install -y virtualization --with-optional

# --- Graphics Applications ---
echo "Installing graphics applications..."
sudo dnf install \
    blender \
    gimp \
    inkscape \
    krita

# --- Multimedia Tools ---
echo "Installing multimedia tools..."
sudo dnf install \
    audacity \
    handbrake-gui \
    kdenlive \
    mkvtoolnix-gui \
    obs-studio

# --- Multimedia Players ---
echo "Installing multimedia players..."
sudo dnf group install -y  vlc
sudo dnf install mpv

# --- Internet Applications ---
echo "Installing internet applications..."
sudo dnf install \
    chromium \
    torbrowser-launcher \
    discord \
    telegram-desktop \
    qbittorrent \
    nicotine+
# TODO: installation for firefox-dev

# --- Library Applications ---
echo "Installing library applications..."
sudo dnf install calibre
# TODO: installation for zotero

# --- Game Launchers ---
echo "Installing game launchers..."
sudo dnf install \
    lutris \
    steam \
    wine

echo "All requested applications and tools have been installed successfully!"
