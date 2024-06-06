function rmds --description "Deletes all .DS_Store files in current directory and all subdirectories."
    set -l files (fd -HI .DS_Store)

    if [ -z "$DS" ]
        echo "No .DS_Store files."
        return 1
    end

    for ds in $files
        echo $ds
    end

    read -p "echo -e 'Delete? [Y/n]\n'" -n 1 action
    switch $action
        case y Y ''
            for ds in $files
                echo "Deleted '$ds'" && rm $ds
            end
            ;;
        case '*'
            echo "Exiting..."
            return 0
            ;;
    end
end
