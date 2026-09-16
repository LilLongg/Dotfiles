function fish_prompt
    set -l last_status $status
    printf '\n'
    set_color yellow
    printf '%s' (whoami)
    set_color normal
    printf ' at '
    set_color magenta
    printf '%s' (hostnamectl hostname)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s ' (prompt_pwd)

    set_color normal
    printf '%s' (__fish_git_prompt)

    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    if test $DEVENV_PROMPT
        printf "(%s) " (set_color blue)(echo $DEVENV_PROMPT)(set_color normal)
    end
    if test $last_status -ne 0
        set_color red
    else
        set_color green
    end
    printf "[%d]" $last_status
    # printf '↪  '
    printf "> "
    set_color normal
end
