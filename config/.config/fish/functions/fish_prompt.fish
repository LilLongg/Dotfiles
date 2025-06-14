# name: Jacaetevha
function tbytes -d 'calculates the total size of the files in the current directory'
    set -l tBytes (du --apparent-size --summarize --byte | cut -f1)
    set -l units " B"

    if test $tBytes -gt 107374182.4
        set tBytes (echo -e "scale=2 \n $tBytes/1073741824 \n quit" | bc)
        set units " GB"
    end

    if test $tBytes -gt 104857.6
        set tBytes (echo -e "scale=2 \n $tBytes/1048576 \n quit" | bc)
        set units " MB"
    end

    if test $tBytes -gt 102.4
        set tBytes (echo -e "scale=2 \n $tBytes/1024 \n quit" | bc)
        set units " KB"
    end

    printf '%.2f' $tBytes
    echo -n "$units"
end

function fish_prompt
    set -l last_status $status
    printf '\n'
    set_color yellow
    printf '%s' (whoami)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s ' (prompt_pwd)

    #set_color blue
    #printf '%s' (tbytes)
    set_color normal
    printf '%s' (__fish_git_prompt)

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    if test $last_status -ne 0
        set_color red
    else
        set_color green
    end
    printf "[%d]" $last_status
    set_color normal
    # printf '↪  '
    printf "> "
end
