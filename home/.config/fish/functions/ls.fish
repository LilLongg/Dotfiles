function ls --wraps='lsd -Xl' --wraps='lsd -XN' --wraps='lsd --group-dirs-first -N' --wraps='lsd --group-directories-first -N' --description 'alias ls=lsd --group-directories-first -N'
  lsd --group-directories-first $argv
        
end
