#!/bin/bash

# ==============================================================================
# Repository and Package Configurations
# ==============================================================================

install_vscode_repo() {
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
}

install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}

neo4j_repo_content="
[neo4j]
name=Neo4j RPM Repository
baseurl=https://yum.neo4j.com/stable/latest
enabled=1
gpgcheck=1"

install_neo4j_repo() {
  sudo rpm --import https://debian.neo4j.com/neotechnology.gpg.key
  echo "$neo4j_repo_content" | sudo tee /etc/yum.repos.d/neo4j.repo > /dev/null
}

# ==============================================================================
# Main Script Execution
# ==============================================================================

# --- System Update and Core Repositories ---
sudo dnf update -y
install_vscode_repo
install_neo4j_repo

# --- Desktop Environment and Office Suite ---
sudo dnf group install -y \
    kde-desktop \
    kde-apps \
    libreoffice

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
sudo dnf group install -y  \
    sql-server \
    mysql
sudo dnf install \
    postgresql* \
    postgis \
    neo4j

# --- Development Tools ---
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
sudo dnf install \
    qgis python3-qgis qgis-grass qgis-server \
    gdal gdal-devel gdal-libs \
    gdal-java gdal-javadoc \
    gdal-python-tools python3-gdal

# --- PDF Tools ---
sudo dnf install \
    pdftk \
    qpdf \
    poppler \
    poppler-utils \
    gs

# --- Development Environments ---
sudo dnf install \
    code \
    kate \
    octave \
    godot

# --- Virtualization ---
sudo dnf group install -y virtualization --with-optional

# --- Graphics Applications ---
sudo dnf install \
    blender \
    gimp \
    inkscape \
    krita

# --- Multimedia Tools ---
sudo dnf install \
    audacity \
    handbrake-gui \
    kdenlive \
    mkvtoolnix-gui \
    obs-studio

# --- Multimedia Players ---
sudo dnf group install -y  vlc
sudo dnf install mpv

# --- Internet Applications ---
sudo dnf install \
    chromium \
    torbrowser-launcher \
    discord \
    telegram-desktop \
    qbittorrent \
    nicotine+
# TODO: installation for firefox-dev

# --- Library Applications ---
sudo dnf install calibre
# TODO: installation for zotero

# --- Game Launchers ---
sudo dnf install \
    lutris \
    steam \
    wine

echo "All applications and tools have been installed successfully!"

