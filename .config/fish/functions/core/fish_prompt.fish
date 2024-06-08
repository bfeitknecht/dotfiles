function fish_prompt --description "Print out the prompt"
    
    if not set -q TRANSIENT
        set -g TRANSIENT 0
    end
    set -l transient $TRANSIENT

    # styles
    
    set -l symbol '$'
    set -l user (whoami)
    
    # different suffix and user color for root
    if functions -q fish_is_root_user; and fish_is_root_user
        set -f u "red"
        set symbol '#'
    end

    set -l host (hostname -s | string replace -r '^student-net-' '')
    set -l cwd (string replace -r '^/Users/bf' '~' $PWD)

    # doesn't work, venv does it by itself /:
    # if test -n "$VIRTUAL_ENV"
    #     set -l venv "$(basename "$VIRTUAL_ENV")"
    # else
    #     set -l venv ""
    # end

    
    if test $transient -eq 1
        printf \e\[0J               # clear the line, idk why
        style -n "$symbol "
        echo
    else
        style -n -o "$user@$host:"
        style -n "$cwd"
        echo
        style -n "$symbol " 
        echo
    end
    
end







##################################################################################



# function fish_prompt --description "Print out the prompt"
#     set -l last_pipestatus $pipestatus
#     set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
#     set -l normal (set_color normal)
#     set -q fish_color_status
#     or set -g fish_color_status red
# 
#     # Color the prompt differently when we're root
#     set -l color_cwd $fish_color_cwd
#     set -l suffix '>'
#     if functions -q fish_is_root_user; and fish_is_root_user
#         if set -q fish_color_cwd_root
#             set color_cwd $fish_color_cwd_root
#         end
#         set suffix '#'
#     end
# 
#     # Write pipestatus
#     # If the status was carried over (if no command is issued or
#     # if `set` leaves the status untouched), don't bold it.
#     set -l bold_flag --bold
#     set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
#     if test $__fish_prompt_status_generation = $status_generation
#         set bold_flag
#     end
#     set __fish_prompt_status_generation $status_generation
#     set -l status_color (set_color $fish_color_status)
#     set -l statusb_color (set_color $bold_flag $fish_color_status)
#     set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
# 
#     echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_git_prompt) $normal " "$prompt_status $suffix " "
# end
