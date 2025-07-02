# Fedora Setup Scripts

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Fedora](https://img.shields.io/badge/Fedora-39+-blue?logo=fedora)](https://getfedora.org/)
[![Shell Script](https://img.shields.io/badge/Shell%20Script-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![KDE Plasma](https://img.shields.io/badge/KDE%20Plasma-5.27+-purple?logo=kde)](https://kde.org/plasma-desktop/)

Automate Fedora Linux setup with these scripts and configuration files. This project is made to save time and effort during initial system setup, application installation, and configuration tweaking after a fresh Fedora installation.

## Features

| Category | Description |
|----------|-------------|
|**Automated Installation** | Install essential applications, development tools, multimedia codecs |
|**Repository Management** | Enable third-party repositories: RPM Fusion, VSCode, Neo4j |
|**Bloatware Removal** | Clean up your KDE default applications |
|**Custom Configuration** | Apply settings for terminal tools (bat, lsd, starship) |
|**Gruvbox Theme** | Color schemes, icons, and cursor packs |

## Project Structure

```
fedora-setup-scripts/
├── assets/
│   ├── gruvbox-dark.png
│   └── gruvbox-light.png
├── config/
│   ├── bat/
│   │   └── config
│   ├── btop/
│   │   ├── btop.conf
│   │   └── themes/
│   ├── kwinrc
│   ├── lsd/
│   │   ├── colors.yaml
│   │   └── config.yaml
│   ├── plasma-org.kde.plasma.desktop-appletsrc
│   ├── plasma-systemmonitor/
│   │   ├── applications.page
│   │   ├── overview.page
│   │   └── processes.page
│   └── starship.toml
├── dnf-config/
│   └── dnf.conf
├── installation-scripts/
│   ├── enable_rpm_repos.sh
│   ├── install_applications.sh
│   ├── install_multimedia_codecs.sh
│   └── remove_bloat.sh
├── local-share/
│   ├── color-schemes/
│   │   └── Gruvbox.colors
│   └── konsole/
│       ├── bookmarks.xml
│       ├── bookmarks.xml.tbcache
│       ├── Gruvbox.colorscheme
│       └── Rainbow.profile
├── LICENSE
└── README.md
```

## Quick Start

<details>
<summary><b>Clone & Navigate</b></summary>

```bash
git clone https://github.com/yourusername/fedora-setup-scripts.git
cd fedora-setup-scripts
```
</details>

<details>
<summary><b>Run Installation Scripts</b></summary>

```bash
# Enable repositories
bash installation-scripts/enable_rpm_repos.sh

# Install applications
bash installation-scripts/install_applications.sh

# Install multimedia codecs
bash installation-scripts/install_multimedia_codecs.sh

# Remove bloatware
bash installation-scripts/remove_bloat.sh
```
</details>

<details>
<summary><b>Apply Configurations</b></summary>

```bash
# Terminal tools configuration
mkdir -p ~/.config/bat ~/.config/lsd
cp config/bat/config ~/.config/bat/
cp config/lsd/* ~/.config/lsd/
cp config/starship.toml ~/.config/

# KDE color schemes and Konsole profiles
mkdir -p ~/.local/share/color-schemes ~/.local/share/konsole
cp local-share/color-schemes/Gruvbox.colors ~/.local/share/color-schemes/
cp local-share/konsole/* ~/.local/share/konsole/
```
</details>

## Script functions

| Script | Description |
|--------|-------------|
| **`enable_rpm_repos.sh`** | Enables RPM Fusion (Free & Non-Free) and Cisco OpenH264 repositories, and updates core packages |
| **`install_applications.sh`** | Installs a comprehensive set of applications, development tools, programming languages, databases, graphics and multimedia tools, internet apps. Also sets up VSCode and Neo4j repositories |
| **`install_multimedia_codecs.sh`** | Installs multimedia codecs, swaps ffmpeg-free for ffmpeg, updates multimedia packages, and enables hardware acceleration |
| **`remove_bloat.sh`** | Removes unnecessary KDE applications and other default bloatware |

## Configuration Files

| Tool | Configuration | Description |
|------|---------------|-------------|
| **bat** | `config/bat/config` | Sets the Gruvbox theme and options for `bat` |
| **lsd** | `config/lsd/config.yaml` & `colors.yaml` | Customizes the appearance and color theme for `lsd` |
| **Starship** | `config/starship.toml` | Gruvbox prompt theme for terminal using [Starship](https://starship.rs/) |
| **KDE** | `local-share/color-schemes/Gruvbox.colors` | Gruvbox color scheme for KDE |
| **Konsole** | `local-share/konsole/` | Konsole terminal profiles and color schemes |

## Gruvbox Theme

Color scheme taken from the retro groove color palette from the [morhetz repository](https://github.com/morhetz/gruvbox).

### Color Palette

#### Dark Mode

![Gruvbox Dark](assets/gruvbox-dark.png)

#### Light Mode

![Grubbox Light](assets/gruvbox-light.png)

### Icon Packs

| Resource | Link | Description |
|----------|------|-------------|
| **Gruvbox Plus Icon Pack** | [Download](https://store.kde.org/p/1961046/) | Complete icon pack matching the Gruvbox theme |
| **Capitaine Cursors** | [Download](https://store.kde.org/p/1818760) | Beautiful cursor pack for a polished look |

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.