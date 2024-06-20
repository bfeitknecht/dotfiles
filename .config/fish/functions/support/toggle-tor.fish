function toggle-tor --description "Toggle TOR proxy and change the network settings accordingly"
    set -f interface "Wi-Fi"
    set -f host SOCKS_PROXY_HOST "localhost"
    set -f port "9050"
    
    networksetup -getsocksfirewallproxy $interface
    echo

    # confirm --message="Proceed with toggle? [y/N]" --default="y" -n 1
    echo "Proceed with toggle? [y/N]"
    read -P "> " proceed
    if not contains $proceed y Y yes Yes
        echo "Aborting toggle"
        return
    end
    
    if ps aux | rg -w [t]or     # tor is running
        # read confirmation
        echo -e "Confirm disconnecting from tor:\n"
        confirm
        test $STATUS -ne 0
        and return 1
                
        echo "Disconnecting from tor..."
        networksetup -setsocksfirewallproxystate $interface off
        killall tor
    else
        echo "Connecting to tor..."
        networksetup -setsocksfirewallproxystate $interface on
        env tor
    end
end
