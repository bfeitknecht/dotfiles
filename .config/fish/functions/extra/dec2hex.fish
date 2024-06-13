function dec2hex --argument number
    # printf '0x%s\n' (echo 'obase=16; '$number | bc | string lower)
    echo 'obase=16;'$number | bc | string lower
end
