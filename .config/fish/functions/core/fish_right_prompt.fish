function fish_right_prompt --description "Print the right prompt"
    set -f right_prompt (cmd_status) # i think this causes the problem of the elusive whitespace
    set -a right_prompt (cmd_duration)
    set -a right_prompt (git_status)
    set -a right_prompt (shlvl_bg)

    # same line as left prompt
    tput sc
    tput cuu1
    tput cuf 2

    echo -n "$right_prompt"
    
    tput rc # return the cursor
end


###############################################################################################################
###############################################################################################################


# command statii, if at least one not zero
function cmd_status
    set -l last_pipestatus $pipestatus  # need to do first, actually capture status before change
    set -lx __fish_last_status $status  # Export for __fish_print_pipestatus
    
    set -q fish_color_status
    or set -g fish_color_status red
    
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $fish_color_status)
    
    set -l cmd_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    if set -q cmd_status
        style $cmd_status
    end
    
    # set -f cmd_status $pipestatus
    # string replace -a -r "\s" "|" $cmd_status
    # set cmd_status "[$cmd_status]"
    # if set -q cmd_status
    #     echo $cmd_status
    # end
end


# command duration if greater than X
function cmd_duration
    set -f t $CMD_DURATION
    
    set -f s (math $t / 1000 % 60)
    set -f m (math --floor $t / 1000 / 60 % 60)
    set -f h (math --floor $t / 1000 / 60 / 60 % 60)
    
    if test "$m" -gt 0
        set -f duration "$m"m""
        if test $s -gt 0
            set -f duration "$m"m "$s"s""
        end
    else if test "$s" -ge 20
            set -f duration "$s"s""
    end

    if set -q duration  # duration > t ?
        style $duration
    end

    # test "$t" -gt 0
    # and set -l s (math $t % 60)
    # test "$s" -gt '59'
    # and set -l m (math --floor $t / 60 % 60)
    # test "$m" -gt 59
    # and set -l h (math --floor $t / 360 % 60)
    # test "$h" -gt 23
    # and set -l d (math --floor $t / 360 / 24)
    # 
    #     
    # duration +=
    #   (d>0) ? d :
    #   (h>0) ? h :   
    #   (m>0) ? m :
    #   (s>0) ? s : ""
    # 
    #
    #   5s
    #   59s
    #   
    #   1m
    #   59m 59s
    #
    #   1h   
    #   23h 59m
    #   
    #   1d
    #   6d 23h
    #  
end


# git status if in repository
function git_status
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints false
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_char_untrackedfiles '%'
    set -g __fish_git_prompt_char_dirtystate '*'
    set -g __fish_git_prompt_char_stagedstate '+'
    set -g __fish_git_prompt_char_conflictedstate '~'
    set -g __fish_git_prompt_char_cleanstate '-'
    set -g __fish_git_prompt_char_invalidstate '#'
    set -g __fish_git_prompt_char_stashstate '..'
    set -g __fish_git_prompt_char_stateseparator ':'
    set -g __fish_git_prompt_char_upstream_ahead '↑'
    set -g __fish_git_prompt_char_upstream_behind '↓'

    if __fish_is_git_repository
        style (fish_git_prompt)
    end
    
    set -e __fish_git_prompt_show_informative_status
    set -e __fish_git_prompt_showcolorhints
    set -e __fish_git_prompt_showupstream
    set -e __fish_git_prompt_showdirtystate
    set -e __fish_git_prompt_showuntrackedfiles
    set -e __fish_git_prompt_showstashstate
    set -e __fish_git_prompt_char_untrackedfiles
    set -e __fish_git_prompt_char_dirtystate
    set -e __fish_git_prompt_char_stagedstate
    set -e __fish_git_prompt_char_conflictedstate
    set -e __fish_git_prompt_char_cleanstate
    set -e __fish_git_prompt_char_invalidstate
    set -e __fish_git_prompt_char_stashstate
    set -e __fish_git_prompt_char_stateseparator
    set -e __fish_git_prompt_char_upstream_ahead
    set -e __fish_git_prompt_char_upstream_behind
end


# shell level and background jobs
function shlvl_bg
    # hm, something fishy is going on here, have a useless space
    #
    #
    
    if set -q TMUX
        if test (math $SHLVL - 2) -gt 0
            set -f shlvl_bg "≡$(math $SHLVL - 2)"
        end
    else
        if test (math $SHLVL - 1) -gt 0
            set -f shlvl_bg "≡$(math $SHLVL - 1)"
        end
    end

    if jobs -q
        set -a shlvl_bg "[&]"
    end

    if set -q shlvl_bg
        style $shlvl_bg
    end
end
