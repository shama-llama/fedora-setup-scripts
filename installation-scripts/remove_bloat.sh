#!/bin/bash

# Remove bloatware installed by default by KDE
echo "Removing KDE bloatware..."
sudo dnf remove -y \
    akregator \
    dragon \
    elisa-player \
    hplip \
    kaddressbook \
    kdeconnectd \
    korganizer \
    kmahjongg \
    kmail \
    kmines \
    kmouth \
    kolourpaint \
    kontact \
    konversation \
    kpat \
    krusader \
    ktorrent \
    neochat
