#!/usr/bin/env bash

# Copy plugins to neovim plugins directory

path_to_plugins="$HOME/.config/nvim/lua/plugins"
repository_url="https://github.com/pachecoio/neovim-plugins.git"

if [ ! -d "$path_to_plugins" ]; then
    mkdir -p "$path_to_plugins"
fi

cd /tmp

if [ ! -d "neovim-plugins" ]; then
    git clone "$repository_url" /tmp/neovim-plugins
else
    cd /tmp/neovim-plugins
    git pull
fi

cd /tmp/neovim-plugins

# copy .lua files to neovim plugins directory
find . -name "*.lua" -exec cp {} "$path_to_plugins" \;

echo "Neovim plugins installed!"
