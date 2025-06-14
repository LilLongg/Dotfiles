function fish_greeting
    printf 'Uptime 󱎫 : %s' (uptime -p | string sub -s 4)
    printf '\n'
    printf 'System age 󰧨 : %s' ($HOME/.config/fish/scripts/system_age)
    printf '\n'
    printf 'Current time  : %s' (date -R)
    printf '\n'
end
