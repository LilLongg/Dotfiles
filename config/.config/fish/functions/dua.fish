function dua --wraps="echo \"(string join ' ' 'let _cur = du'  '; let _len = .path.0 | str length; let _last = .path.0 | str reverse | str index-of /; let _range = 0..( -  - 1); du (.path.0 | str substring ) | append ()')\" | xargs nu -c" --description 'alias dua=dua i'
 command dua i $argv
        
end
