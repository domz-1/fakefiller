#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}=========================================${NC}"
echo -e "${GREEN}   🎭 Installing FakeFiller Linux        ${NC}"
echo -e "${BLUE}=========================================${NC}"

# 1. Install Dependencies
echo -e "${YELLOW}Checking dependencies...${NC}"

install_deps() {
    if command -v apt-get &>/dev/null; then
        echo -e "${BLUE}Detected Debian/Ubuntu system.${NC}"
        sudo apt-get update -y || true
        sudo apt-get install -y python3 python3-gi gir1.2-gtk-3.0 xclip copyq libnotify-bin
    elif command -v pacman &>/dev/null; then
        echo -e "${BLUE}Detected Arch Linux system.${NC}"
        sudo pacman -S --noconfirm python python-gobject gtk3 xclip copyq libnotify
    elif command -v dnf &>/dev/null; then
        echo -e "${BLUE}Detected Fedora/RHEL system.${NC}"
        sudo dnf install -y python3 python3-gobject gtk3 xclip copyq libnotify
    elif command -v zypper &>/dev/null; then
        echo -e "${BLUE}Detected openSUSE system.${NC}"
        sudo zypper install -y python3 python3-gobject gtk3 xclip copyq libnotify-tools
    else
        echo -e "${YELLOW}Warning: Unknown package manager. Please ensure python3, python3-gi, gtk3, xclip, and copyq are installed.${NC}"
    fi
}

if ! command -v xclip &>/dev/null || ! command -v copyq &>/dev/null; then
    echo -e "${YELLOW}Some dependencies are missing. Installing...${NC}"
    install_deps
else
    echo -e "${GREEN}✓ All core dependencies found!${NC}"
fi

# 2. Install Executables to ~/.local/bin
echo -e "${YELLOW}Installing fakefiller and mock commands to ~/.local/bin...${NC}"
mkdir -p "$HOME/.local/bin"
cp -f "$(dirname "$0")/bin/fakefiller" "$HOME/.local/bin/fakefiller"
chmod +x "$HOME/.local/bin/fakefiller"
ln -sf "$HOME/.local/bin/fakefiller" "$HOME/.local/bin/mock"

# 3. Install Desktop Launcher
echo -e "${YELLOW}Installing desktop application launcher...${NC}"
mkdir -p "$HOME/.local/share/applications"
cp -f "$(dirname "$0")/assets/fakefiller.desktop" "$HOME/.local/share/applications/fakefiller.desktop"
command -v update-desktop-database &>/dev/null && update-desktop-database "$HOME/.local/share/applications" || true

# 4. Setup GNOME Shortcut (Alt+M for Mock Generator)
if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || [ "$XDG_CURRENT_DESKTOP" = "ubuntu:GNOME" ] || [ "$DESKTOP_SESSION" = "ubuntu" ] || [ "$DESKTOP_SESSION" = "gnome" ]; then
    echo -e "${YELLOW}Configuring GNOME global shortcuts (Alt+M)...${NC}"
    EXISTING=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | tr -d '@as ' | sed 's/\[//;s/\]//')
    
    KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/fakefiller0/"
    
    if [[ ! "$EXISTING" =~ "fakefiller0" ]]; then
        if [ -z "$EXISTING" ]; then
            NEW_LIST="['$KEY_PATH']"
        else
            NEW_LIST="[$(echo "$EXISTING" | sed "s/]$//"), '$KEY_PATH']"
        fi
        gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$NEW_LIST" || true
    fi

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY_PATH name "FakeFiller - Mock Generator (Alt+M)" || true
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY_PATH command "$HOME/.local/bin/fakefiller" || true
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY_PATH binding "<Alt>m" || true
fi

echo -e "\n${GREEN}=========================================${NC}"
echo -e "${GREEN}   ✅ FakeFiller Installed Successfully!   ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo -e "${BLUE}How to use:${NC}"
echo -e "1. Place cursor in any input field or text area."
echo -e "2. Press ${YELLOW}Alt + M${NC} to open the instant mock data palette."
echo -e "3. Select any item (Email, Arabic Name, Phone, UUID, Card, etc.) and hit ${YELLOW}Enter${NC}."
echo -e "4. Or in terminal: ${YELLOW}mock email${NC}, ${YELLOW}mock uuid${NC}, ${YELLOW}mock card${NC}"
echo -e "\nEnjoy! 🎭✨"
