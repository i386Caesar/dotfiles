#!/bin/bash
# this script is going to be used to update karabiners json

# CD into karabiners repo dir
pushd ~/dotfiles/gen-karabiner-config/
echo "Building Karabiners.json config file"
bun run build

echo "Deleting old karabiner.json config file"
pushd ~/.config/karabiner/
rm -rf karabiner.json

# stow the new files
pushd ~/dotfiles/
echo "Stowing Karabiners"
stow karabiner

echo "Removing all directories from stack popd"
popd
popd

echo "Restarting karabiner service"
launchctl kickstart -k gui/$(id -u)/org.pqrs.karabiner.karabiner_console_user_server
