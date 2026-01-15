#!/usr/bin/env bash

# FLUTTER - Google's UI toolkit for building native apps
# Version: 3.38.5

# Variables

set -e

FLUTTER_DIR="$PREFIX/opt/flutter"
FLUTTER_BIN="$PREFIX/bin/flutter"
TMP_ARCHIVE="$TMPDIR/flutter.7z"


# Getting the latest version
FLUTTER_VERSION=$(curl -s https://api.github.com/repos/Alienkrishn/flutter/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//')

FLUTTER_URL="https://github.com/Alienkrishn/flutter/releases/download/$FLUTTER_VERSION/flutter.7z"


install_deps(){
  apt update && apt upgrade -y
  apt install git axel which gtk3 xorgproto ninja cmake clang pkg-config termux-x11-nightly p7zip -y
}


install_flutter(){
  echo "[*] Setting up Flutter $FLUTTER_VERSION..."
  [ -d "$FLUTTER_DIR" ] && { echo "[*] Removing existing installation..."; rm -rf "$FLUTTER_DIR"; }
  
  echo "[*] Creating installation directory..."
  mkdir -p "$PREFIX/opt"

  echo "[*] Downloading Flutter SDK..."
  axel -n 10 -o "$TMP_ARCHIVE" "$FLUTTER_URL" || { echo "[!] Download failed"; exit 1; }

  echo "[*] Extracting Flutter SDK..."
  7z x "$TMP_ARCHIVE" -o"$PREFIX/opt" -y > /dev/null || { echo "[!] Extraction failed"; exit 1; }

  echo "[*] Creating launcher..."
  cat > "$FLUTTER_BIN" << EOF
  #!/data/data/com.termux/files/usr/bin/bash
  exec "$FLUTTER_DIR/bin/flutter" "\$@"
EOF

  chmod +x "$FLUTTER_BIN"
  echo "[*] Setting permissions..."
  chmod -R 755 "$FLUTTER_DIR/bin"

}

success_msg(){
  echo -e "\n[√] Flutter $FLUTTER_VERSION installed successfully!"
  echo "Run: flutter --version"
  echo "Run: flutter doctor"
  exit 0
}

install_deps
install_flutter
success_msg

