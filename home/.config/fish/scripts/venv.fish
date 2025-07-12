#!/usr/bin/fish

switch $argv[1]
    case list
        $HOME/.config/fish/scripts/vlist.nu
    case create
        uv venv --directory=$HOME/.venv $argv[2..] --relocatable
        set -l cur_dir (pwd)
        set -l new_venv (ls -t1 $HOME/.venv | head -n1)
        source $HOME/.venv/$new_venv/bin/activate.fish
        uv pip install -r $HOME/.config/python_defaults.txt
        deactivate
        cd $cur_dir
    case remove
        rm -rf $HOME/.venv/$argv[2]
    case activate
        set -l cur_dir (pwd)
        source $HOME/.venv/$argv[2]/bin/activate.fish
        cd $cur_dir
    case rename
        rm -rf $HOME/.venv/$argv[3]
        mv $HOME/.venv/$argv[2] $HOME/.venv/$argv[3]
end
