#!/usr/bin/env bash
set -euo pipefail

REQUIREMENTS=(tmux fzf ripgrep curl build-essential unzip stow)

install_debian() {
    sudo apt update
    sudo apt install -y "${REQUIREMENTS[@]}"
}

install_arch() {
    sudo pacman -Syu --noconfirm "${REQUIREMENTS[@]}"
}

install_brew() {
    brew install "${REQUIREMENTS[@]}"
}

echo "🔍 Detectando sistema..."

if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "🐧 Detectado WSL (Debian/Ubuntu)."
    install_debian
elif command -v apt-get >/dev/null; then
    echo "🐧 Detectado Debian/Ubuntu."
    install_debian
elif command -v pacman >/dev/null; then
    echo "🐧 Detectado Arch Linux."
    install_arch
elif command -v brew >/dev/null; then
    echo "🍎 Detectado macOS con Homebrew."
    install_brew
else
    echo "⚠️  Sistema no soportado. Instala manualmente:"
    echo "   ${REQUIREMENTS[*]}"
    exit 1
fi

echo "✅ Requirements instalados (excepto Neovim)."

