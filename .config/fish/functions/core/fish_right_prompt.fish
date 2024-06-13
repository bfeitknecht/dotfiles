function fish_right_prompt --description "Print the right side prompt"
    set -l last_pipestatus $pipestatus  # first to actually capture the status before changing it
    set -lx __fish_last_status $status  # Export for __fish_print_pipestatus
    set -q fish_color_status
    or set -g fish_color_status red
    
    if not set -q TRANSIENT
        set -g TRANSIENT 1
    end
    set -l transient $TRANSIENT
    
    tput sc; tput cuu1; tput cuf 2 # make the prompt print on the same line as path

    ###############################################################################################################
    ###############################################################################################################
    # set the pipestatus
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    
    ###############################################################################################################
    ###############################################################################################################
    # set the last command's duration
    set -l t $CMD_DURATION
    set -l s (math --floor $t / 1000 % 60)
    set -l m (math --floor $t / 1000 / 60 % 60)
    set -l h (math --floor $t / 1000 / 60 / 60 % 60)
    if test "$m" -gt 0
        set -g duration "$m"m""
        if test $s -gt 0
            set -g duration "$m"m "$s"s""
        end
    else if test "$s" -ge 20
            set -g duration "$s"s""
    else
        set -e duration 
    end
    
#     set -l t $CMD_DURATION
#     set -l s (math --floor $t / 1000)
#     set -l m (math --floor $s / 60)
#     set -l h (math --floor $m / 60)
#     set -l d (math --floor $h / 24)
# 
#     set -g delta ""
#     test $d -gt 0; and set delta "$d"d; or
#     test $h -gt 0; 

# duration +=
#   (d>0) ? d :
#   (h>0) ? h :   
#   (m>0) ? m :
#   (s>0) ? s : ""
# 
# 
#   false; or true
#   and echo y
#   or echo n
#   ... repaet the block here

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
    
    ###############################################################################################################
    ###############################################################################################################
    # set git status if in repository
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints false
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showstashstate true
    
    set -g __fish_git_prompt_char_cleanstate '-'
    set -g __fish_git_prompt_char_conflictedstate '~'
    set -g __fish_git_prompt_char_dirtystate '*'
    set -g __fish_git_prompt_char_invalidstate '#'
    set -g __fish_git_prompt_char_stagedstate '+'
    set -g __fish_git_prompt_char_stashstate '..'
    set -g __fish_git_prompt_char_stateseparator ':'
    
    set -g __fish_git_prompt_char_untrackedfiles '%'
    set -g __fish_git_prompt_char_upstream_ahead '↑'
    set -g __fish_git_prompt_char_upstream_behind '↓'
    # set -g __fish_git_prompt_char_upstream_diverged '!'   # disabled in showupstream=informative
    # set -g __fish_git_prompt_char_upstream_equal ''
    set -l git_prompt (fish_git_prompt)

    
    ###############################################################################################################
    ###############################################################################################################
    # set SHLVL
    if test (math $SHLVL - 1) -gt 0
        set -g shlvl "≡$(math $SHLVL - 1)"
    end

    
    ###############################################################################################################
    ###############################################################################################################
    # display all of it
    
    if test -n "$prompt_status"
        set -p duration ""
    end
    
    if test -n "$prompt_status" -o -n "duration"
        set -p shlvl ""
    end
    
    echo -n "$prompt_status"
    echo -n "$duration"
    echo -n "$git_prompt"
    echo -n "$shlvl"
    
    set -e duration
    set -e shlvl
    
    tput rc # return the cursor
end

