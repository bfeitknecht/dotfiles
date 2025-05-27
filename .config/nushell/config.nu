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
use util * # why need glob? want to use as module
# use std/config ["light-theme", "dark-theme"]


## config
#
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.config.edit_mode = "vi"

## nupm setup
$env.NUPM_HOME = ($nu.default-config-dir | path join "nupm")
use nupm/nupm
#nupm install nupm --force --path

$env.NU_LIB_DIRS = [
    ($env.NUPM_HOME | path join "modules")
]

$env.PATH = (
    $env.PATH
        | split row (char esep)
        | prepend ($env.NUPM_HOME | path join "scripts")
        | uniq
)




## look into this:
# overlays
# dirs/shells stacks


## put this into util somewhere
# private ip
# ipconfig getifaddr en0

# public ip
# curl ifconfig.io
