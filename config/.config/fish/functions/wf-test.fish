function wf-test --wraps='ping archlinux.org -c 5' --description 'alias wf-test=ping archlinux.org -c 5'
  ping archlinux.org -c 5 $argv
        
end
