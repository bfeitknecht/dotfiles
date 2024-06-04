function up
    set -f counter (math --ceil (test -z $argv[1]; and echo 1; or echo $argv[1]))
    set -f parent "../"
    set -f up ""
    
    while test $counter -gt 0
        set counter (math --ceil $counter - 1)
        set up "$up$parent"
    end
    echo $up
end
