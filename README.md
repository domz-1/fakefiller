# 🎭 FakeFiller Linux - Instant Mock Data Generator & Form Filler

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux%20(X11%20%26%20GNOME)-orange.svg)]()
[![Python](https://img.shields.io/badge/Python-3.8%2B-green.svg)]()
[![Languages](https://img.shields.io/badge/Supports-English%20%7C%20Arabic%20%7C%20Bilingual-purple.svg)]()

A blazing-fast, Raycast-style mock data generator and form filler for Linux. Press **`Alt + M`**, type what you need (Email, Egyptian National ID, Arabic Name, UUID, Test Credit Card, Lorem Ipsum, Markdown Table), hit **`Enter`**, and watch it **automatically paste right into your active text field**!

---

## ✨ Features

- ⚡ **Global Instant Palette (`Alt + M`):** Opens a sleek, dark-themed floating command palette with live instant search.
- 🌍 **Bilingual Support (English & Arabic):**
  - Realistic **Arabic Full Names** (e.g. `محمود الشريف`, `سارة إبراهيم`).
  - Realistic **English Full Names** (e.g. `Alex Brown`, `Sarah Miller`).
- 🪪 **Region-Specific Data:**
  - **Egyptian National ID:** Valid 14-digit format compliant with century, birth date, governorate code, and checksum.
  - **Phone Numbers:** Egypt (+20), Saudi Arabia (+966), and US (+1).
- 💳 **Finance & Gateway Testing:**
  - Valid Luhn-compliant Test Credit Cards (Visa & Mastercard) with realistic Expiration Dates and CVV codes.
- 💻 **Developer & Tech Primitives:**
  - UUID v4, NanoID, MongoDB ObjectId, IPv4, Hex Colors, ISO 8601 Timestamps, and Unix Epoch.
  - Complete **Mock JSON Payloads** with 1 click.
- 📊 **Markdown Table Generator:** Convert tabular CSV/TSV data from your clipboard directly into a clean Markdown table.
- 💻 **Familiar CLI `mock` Command:** Use `mock email`, `mock uuid`, `mock card` directly in your terminal scripts.

---

## 📸 Mock Data Catalog

| Category | Available Mock Types |
| :--- | :--- |
| **Personal** | English Full Name, Arabic Full Name (`الاسم بالكامل`), Username, Strong Password, Job Title, Company |
| **Contact** | Email Address, Phone (Egypt/Saudi/US), Street Address & City |
| **Identifiers** | UUID v4, NanoID, MongoDB ObjectId, Egyptian 14-digit National ID |
| **Finance** | Luhn-Valid Visa, Mastercard (with Expiry & CVV) |
| **Tech & Dev** | IPv4, Hex Color, ISO 8601 Date, Unix Timestamp, Mock JSON User Object |
| **Text** | Lorem Ipsum (Sentence, Paragraph) |
| **Formatting** | Clipboard CSV/TSV to Markdown Table |

---

## 🛠️ Installation

### 1-Line Quick Install

```bash
git clone https://github.com/domz-1/fakefiller.git
cd fakefiller
make install
```

*(The installer will auto-detect your distribution, install dependencies, place binaries in `~/.local/bin`, and configure your global `Alt + M` shortcut).*

---

### Manual Installation per Distribution

#### 🐧 Ubuntu / Debian / Linux Mint:
```bash
sudo apt update
sudo apt install -y python3 python3-gi gir1.2-gtk-3.0 xclip copyq libnotify-bin
git clone https://github.com/domz-1/fakefiller.git
cd fakefiller
./install.sh
```

#### 🐧 Arch Linux / Manjaro:
```bash
sudo pacman -S --noconfirm python python-gobject gtk3 xclip copyq libnotify
git clone https://github.com/domz-1/fakefiller.git
cd fakefiller
./install.sh
```

#### 🐧 Fedora / RHEL:
```bash
sudo dnf install -y python3 python3-gobject gtk3 xclip copyq libnotify
git clone https://github.com/domz-1/fakefiller.git
cd fakefiller
./install.sh
```

---

## 🕹️ Usage & Examples

### 1. The Global Shortcut
1. Put your cursor in any form, input field, or code editor.
2. Press **`Alt + M`**.
3. Type what you need (e.g. `email` or `card` or `ar`) and hit **`Enter`**.
4. The mock data is generated and pasted immediately!

### 2. Command Line Interface (CLI)

```bash
# Generate and copy a mock email
mock email

# Generate a fresh UUID v4
mock uuid

# Generate a random Arabic name
mock ar-name

# Generate a fake test credit card
mock card

# Generate a mock JSON object
mock json

# Convert clipboard CSV into Markdown table
mock table
```

---

## 🗑️ Uninstallation

```bash
cd fakefiller
make uninstall
```

---

## 👨‍💻 Author & Credits

Created with ❤️ by **Adham** ([@domz-1](https://github.com/domz-1)).

If you find FakeFiller useful, please give it a ⭐️ on GitHub!
