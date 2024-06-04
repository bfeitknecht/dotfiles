function cdup
    clear
    # echo -n (printf "\033[2A\033[2K\033[1E\033[2K")
    cd (up $argv)
    # echo $PWD:
    ls
    echo
    commandline -f repaint
end
