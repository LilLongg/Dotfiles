function fish_greeting
    printf 'Uptime 󱎫 : %s' (uptime-fmt)
    printf '\n'
    printf 'System age 󰧨 : %s' (system-age)
    printf '\n'
    printf 'Current time  : %s' (date -R)
    printf '\n'
end
