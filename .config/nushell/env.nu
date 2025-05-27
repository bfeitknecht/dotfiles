# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
let additionals = [
  "/opt/homebrew/bin",
  "/usr/local/bin",
  "/Users/bf/.local/bin",
  "/Users/bf/.orbstack/bin",
  "/Users/bf/.ghcup/bin",
  "/Users/bf/.go/bin",
  "/Users/bf/.cargo/bin",
  "/users/bf/.cl/bin",
  "/opt/homebrew/opt/openjdk/bin"
]

$env.PATH = $additionals ++ ($env.PATH | split row (char esep))


