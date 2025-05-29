#!/usr/bin/fish

switch $argv[1]
    case list
        $HOME/.config/fish/scripts/vlist.nu
    case create
        uv venv --directory=$HOME/.venv $argv[2..]
        set -l new_venv (ls -t1 $HOME/.venv | head -n1)
        source $HOME/.venv/$new_venv/bin/activate.fish
        uv pip install -r $HOME/.config/python_defaults.txt
        deactivate
    case remove
        rm -rf $HOME/.venv/$argv[2]
    case activate
        source $HOME/.venv/$argv[2]/bin/activate.fish
end
