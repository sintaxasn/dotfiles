#!/usr/bin/env bash
set -e

# install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
  echo "[i] Install Command Line Tools"
  xcode-select --install
fi

# install homwbrew
if [[ ! -x /usr/local/bin/brew ]]; then
  echo "[i] Install Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
	echo "[i] Install Ansible"
	brew install ansible
fi

set +e

# set macos defaults
echo "[i] Set macOS settings"
./macos.bash

# run playbook
echo "[i] Run Playbook"
ansible-playbook -i ../ansible/inventory ../ansible/dotfiles.yml --ask-become-pass

echo "[i] From now on you can use $ dotfiles to manage your dotfiles"
echo "[i] Done."
