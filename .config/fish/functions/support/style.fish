function style --description "Print the last argument with styling"
   
    argparse \
        'b/background=?' \
        'c/color=?' \
        'o/bold' \
        'd/dim' \
        'i/italic' \
        'r/reverse' \
        'n/no-newline' \
        'h/help' \
        -- $argv
    or set -l arg_err
    
    set -l help_msg "
    Style test according to fish's set_color(1)
    
    Valid colors include:

     • black, red, green, yellow, blue, magenta, cyan, white
     
     • brblack, brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite

    The following options are available:

    -b or --background=COLOR

    -c or --color=COLOR

    -o or --bold

    -d or --dim

    -i or --italics

    -r or --reverse

    -u or --underline

    -n or --no-newline

    -h or --help
    "
    
    set -q _flag_help
    and echo $help_msg
    and return 1
    
    set -f style
    
    set -q _flag_background
    and set -a style "--background" $_flag_background
    
    set -q _flag_bold
    and set -a style "--bold"

    set -q _flag_dim
    and set -a style "--dim"

    set -q _flag_italic
    and set -a style "--italic"

    set -q _flag_reverse
    and set -a style "--reverse"

    set -q _flag_color
    and set -a style $_flag_color

    set_color $style
    echo -n $argv
    set_color normal
    
    not set -q _flag_n
    and echo
end
