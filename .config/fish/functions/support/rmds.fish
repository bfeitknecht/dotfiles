function rmds --description "Deletes all .DS_Store files in current directory and all subdirectories."
    
    set -f files (fd -HI .DS_Store)
    if test -z "$files"
        echo "No .DS_Store files."
        return 1
    else
        for f in $files
            echo $f
        end
    end

    read -p "echo -e 'Delete? [Y/n]\n'" -n 1 action
    switch $action
        case y Y ''
            for f in $files
                echo "Deleted '$f'" && rm $f
            end
            ;;
        case '*'
            echo "Exiting."
            return 0
            ;;
    end
end
