function fish_right_prompt -d "Write out the right prompt"
    # set -l prev_stat $status
    # printf '\n'

    # if test $prev_stat -ne 0
    #     set_color red
    #     printf '✘  '
    # else
    #     set_color green
    #     printf '✔  '
    # end

    set_color yellow
    printf '\uf252 '

    set -l dr_ml $CMD_DURATION
    if test $dr_ml -gt 1000
        set -l dr_sec (echo -e "scale=0 \n $dr_ml/1000 \n quit" | bc)
        set dr_ml (echo -e "scale=0 \n $dr_ml%1000 \n quit" | bc)

        if test $dr_sec -gt 60
            set -l dr_min (echo -e "scale=0 \n $dr_sec/60 \n quit" | bc)
            set dr_sec (echo -e "scale=0 \n $dr_sec%60 \n quit" | bc)

            if test $dr_min -gt 60
                set -l dr_hr (echo -e "scale=0 \n $dr_min/60 \n quit" | bc)
                set dr_min (echo -e "scale=0 \n $dr_min%60 \n quit" | bc)
                printf '%d hr ' $dr_hr
            end

            printf '%d m ' $dr_min
        end

        printf '%d s ' $dr_sec
    end

    printf '%d ms' $dr_ml
    set_color normal
end
