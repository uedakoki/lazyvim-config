#!/bin/bash
set -eu

SCRIPT_DIR=$(readlink -f "$(dirname "$0")")

rm -rf "$HOME"/.local/share/nvim
rm -rf "$HOME"/.cache/nvim

NVIM_TGT=$SCRIPT_DIR/nvim
NVIM_LINK=$XDG_CONFIG_HOME
ln -sf "$NVIM_TGT" "$NVIM_LINK"
