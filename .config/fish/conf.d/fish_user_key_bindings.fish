function fish_user_key_bindings --description "Define default user key bindings"

    bind \r execute-transient
    bind \ek clear-everything
    bind \el __fish_list_current_token
    bind \e- cdup-ls
    bind \cE end-of-line
    bind \cd detach

    fzf_configure_bindings \
        --directory=\cf \
        --git_log=\cl \
        --git_status=\cs \
        --history=\cr \
        --processes=\cp \
        --variables=\cv
    
end




#########################################################################################################

function cdup-ls
    cdup
    #__fish_list_current_token
    commandline -f repaint
end

function reset-transient --on-event fish_postexec
    set -g TRANSIENT 0
end

function execute-transient
    if commandline --is-valid
    # or test (count $argv) -eq 0
        set -g TRANSIENT 1
        commandline -f repaint
    else
        set -g TRANSIENT 0
    end
    commandline -f execute
end

function detach
  if set -q TMUX
    tmux detach -P
  else
    exit
  end
end

function clear-everything
  commandline -f repaint
  commandline -f clear-screen
  
end


function copy-commandline
  commandline | fish_clipboard_copy
end
