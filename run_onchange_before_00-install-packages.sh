#!/bin/bash

_ostype=$(uname -s)

INSTALL_SCRIPTS=""

if ! command -v zoxide; then
  echo "Installing zoxide"
  INSTALL_SCRIPTS=("${INSTALL_SCRIPTS[@]}" 'curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh')
else
  echo "Skipping zoxide"
fi

if [ "${_ostype}" = "Darwin" ]; then
  if ! command -v brew; then
    echo "Installing homebrew"
    INSTALL_SCRIPTS=("${INSTALL_SCRIPTS[@]}" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
  else
    echo "Skipping homebrew"
  fi
else
  if ! command -v nvim; then
    echo "Installing neovim"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
  fi
fi

for c in "${INSTALL_SCRIPTS[@]}"; do
  eval "$c"
done

PKGS="ripgrep curl fish lsd fzf bat git"
if [ "${_ostype}" = "Darwin" ]; then
  PKGS="$PKGS neovim fd gcc"
else
  PKGS="$PKGS fd-find build-essential"
fi
if [ "${_ostype}" = "Darwin" ]; then
  brew install $PKGS
else
  sudo apt-get install -y $PKGS
fi
