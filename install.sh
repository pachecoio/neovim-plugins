/bin/bash

# Copy plugins to neovim plugins directory

path_to_plugins="~/.config/nvim/lua/plugins"
repository_url="https://github.com/pachecoio/neovim-plugins.git"

if [ ! -d "$path_to_plugins" ]; then
    mkdir -p "$path_to_plugins"
fi

cd /tmp

if [ ! -d "neovim-plugins" ]; then
    git clone "$repository_url"
else
    cd neovim-plugins
    git pull
fi

cd neovim-plugins

# copy all files except the install script
find . -type f -not -name "install.sh" -exec cp {} "$path_to_plugins" \;
