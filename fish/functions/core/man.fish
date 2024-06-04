# function man --description "Colored man pages"
# 
#     set -lx LESS_TERMCAP_md (tput bold; tput setaf 1)       # start bold cyan
#     set -lx LESS_TERMCAP_me (tput sgr0)                     # end so, us, mb, md, mr
#     
#     set -lx LESS_TERMCAP_so (tput bold; tput setab 127)     # start standout magenta
#     set -lx LESS_TERMCAP_se (tput sgr0)                     # end standout
#     
#     set -lx LESS_TERMCAP_us (tput smul; tput setaf 83)      # start underline light green
#     set -lx LESS_TERMCAP_ue (tput sgr0)                     # end underline
# 
#     command man "$argv"
# end
