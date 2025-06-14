function lsid
    echo \"(string join ' ' ls \"$argv\" \| where type \"==\" dir)\" | xargs nu -c
end
