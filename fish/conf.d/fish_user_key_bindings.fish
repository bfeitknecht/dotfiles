function fish_user_key_bindings --description "Define default user key bindings"

    bind \r execute_trans
    bind \e- cdup
    bind \el clear-screen # --status
    bind \cE end-of-line

end

function execute_trans
    if commandline --is-valid
    # or test (count $argv) -eq 0
        set -g TRANSIENT 1
        commandline -f repaint
    else
        set -g TRANSIENT 0
    end
    commandline -f execute
end
