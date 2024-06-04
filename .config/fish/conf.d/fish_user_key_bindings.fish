function fish_user_key_bindings --description "Define default user key bindings"

    bind \r trans-execute
    bind \e- cdup
    bind \ek clear-screen
    bind \el clear-ls
    bind \cE end-of-line

end

function trans-execute
    if commandline --is-valid
    # or test (count $argv) -eq 0
        set -g TRANSIENT 1
        commandline -f repaint
    else
        set -g TRANSIENT 0
    end
    commandline -f execute
end

function clear-ls
    echo
    clear
    ls
    echo
    commandline -f repaint
end
