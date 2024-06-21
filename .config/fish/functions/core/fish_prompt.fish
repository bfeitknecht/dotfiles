function fish_prompt --description "Print out the prompt"
    if not set -q TRANSIENT
        set -g TRANSIENT 0
    end
    set -l transient $TRANSIENT

    set -l symbol '$'
    set -l user (whoami)
    
    # different suffix and user color for root
    if functions -q fish_is_root_user; and fish_is_root_user
        set -f u "red"
        set symbol '#'
    end

    set -l host (hostname -s | string replace -r '^student-net-' '')
    set -l cwd (string replace -r "^.*$USER" '~' $PWD)

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

# cut optional trailing slash
# string replace -r '/$' '' $HOME

# try to do it in one go
