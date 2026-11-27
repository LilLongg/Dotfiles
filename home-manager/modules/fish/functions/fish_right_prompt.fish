function fish_right_prompt -d "Write out the right prompt"
    set_color yellow
    printf '\uf252 '

    set -l dr_ml $CMD_DURATION
    if test $dr_ml -gt 1000
        set -l dr_sec (math -s0 $dr_ml / 1000)
        set dr_ml (math $dr_ml % 1000)

        if test $dr_sec -gt 60
            set -l dr_min (math -s0 $dr_sec / 60)
            set dr_sec (math $dr_sec % 60)

            if test $dr_min -gt 60
                set -l dr_hr (math -s0 $dr_min / 60)
                set dr_min (math $dr_min % 60)
                printf '%d hr ' $dr_hr
            end

            printf '%d m ' $dr_min
        end

        printf '%d s ' $dr_sec
    end

    printf '%d ms' $dr_ml
    set_color normal
end
