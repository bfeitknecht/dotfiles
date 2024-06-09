function rmtm --description "Remove snapshots or backups with tmutil."
    rmsnapshots
end


function rmsnapshots
    set -f snapshots (tmutil listlocalsnapshotdates | tail -n +2)

    if test -z "$snapshots"
        echo "No snapshots."
        return 1
    else
        for snapshot in $snapshots
            echo "'$snapshot'"
        end
    end
    
    read -p "echo -e 'Delete? [Y/n]\n'" -n 1 proceed
    switch $proceed
        case y Y ''
            for snapshot in $snapshots
                tmutil deletelocalsnapshots $snapshot
            end
            ;;
        case '*'
            echo "Exiting."
            return 0
            ;;
    end
end

