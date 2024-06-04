function reset-transient --on-event fish_postexec
    set -g TRANSIENT 0
end

function maybe_execute
    
    if commandline --is-valid
    # or test $argv -z
        set -g TRANSIENT 1
        commandline -f repaint
    else
        set -g TRANSIENT 0
    end
    commandline -f execute
end

bind \r maybe_execute
