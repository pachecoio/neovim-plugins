/bin/bash

# Copy plugins to neovim plugins directory

path_to_plugins="~/.config/nvim/plugins"
repository_url="https://github.com/pachecoio/neovim-plugins.git"

if [ ! -d "$path_to_plugins" ]; then
    mkdir -p "$path_to_plugins"
fi

cd /tmp

git clone "$repository_url"

cd neovim-plugins

cp -r * "$path_to_plugins"
