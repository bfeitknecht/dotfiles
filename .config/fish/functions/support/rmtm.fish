function rmtm --description "Remove snapshots or backups with tmutil."
    rmsnapshots

end


function rmsnapshots
    set -l snapshots (tmutil listlocalsnapshotdates | tail -n +2)

    if [ -z "$snapshots" ]
        echo "No snapshots."
        return 1
    end
    
    for snapshot in $snapshots
        echo "'$snapshot'"
    end

    read -p "echo -e 'Delete? [Y/n]\n'" -n 1 proceed
    switch $proceed
        case y Y ''
            for snapshot in $snapshots
                tmutil deletelocalsnapshots $snapshot
            end
            ;;
        case '*'
            return 0
            ;;
    end
end

