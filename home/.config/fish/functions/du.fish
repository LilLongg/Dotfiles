function du --wraps=du --description 'alias du using nushell'
    echo \"(string join ' ' du \"$argv\")\" | xargs nu -c

end
