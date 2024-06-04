function mkcd --description "Create a new directory and change to it" --argument dir
    mkdir -p -- $dir
    cd -- $dir
end
