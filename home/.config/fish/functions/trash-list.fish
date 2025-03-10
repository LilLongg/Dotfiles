function trash-list --wraps="nu -c 'ls ~/.local/share/Trash/files'" --description "alias trash-list=nu -c 'ls ~/.local/share/Trash/files'"
    echo \"(string join ' ' ls ~/.local/share/Trash/files) --du\" | xargs nu -c

end
