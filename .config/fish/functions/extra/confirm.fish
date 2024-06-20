function confirm
    # argparse to get optional default value, abort message and response length
    # if n#num not set, assign 0 to read all
    # problem:      can't check for regex with contains
    
    read -P "$argv> " response
    contains $response y Y yes YES
end
