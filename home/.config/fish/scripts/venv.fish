#!/usr/bin/fish

switch $argv[1]
    case list
        $HOME/.config/fish/scripts/vlist.nu
    case create
        uv venv --directory=$HOME/.venv $argv[2..]
    case remove
        rm -rf $HOME/.venv/$argv[2]
    case activate
        source $HOME/.venv/$argv[2]/bin/activate.fish
end
