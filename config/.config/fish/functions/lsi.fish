function lsi --wraps=nu\ -c\ \'ls\ \' --description alias\ lsi=nu\ -c\ \'ls\ \'
    echo \"(string join ' ' ls \"$argv\") \| sort-by type\" | xargs nu -c

end
