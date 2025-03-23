# config.nu
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options


## imports
#
use util *
# use std/config ["light-theme", "dark-theme"]


## config 
#
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.config.edit_mode = "vi"



# look into this:
# overlays
# dirs/shells stacks

# local ip
# ipconfig getifaddr en0

# public ip
# curl ifconfig.io

