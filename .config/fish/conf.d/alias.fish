alias tree="eza --classify=always --tree"
alias l="eza --classify=always --tree --level=2"

alias cat="bat --style=plain,numbers,changes,rule,snip"

alias totp="security find-generic-password -s TOTP_CLI_DB -w | \
    totp-cli generate --follow ETH bfeitknecht@ethz.ch 2>/dev/null"

alias vpn="/Users/bf/HOME/CODE/services/vpn/toggle_ethz_vpn.sh"


function export-esp
  set -x LIBCLANG_PATH "/Users/bf/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-19.1.2_20250225/esp-clang/lib"
  set -x PATH "/Users/bf/.rustup/toolchains/esp/xtensa-esp-elf/esp-14.2.0_20240906/xtensa-esp-elf/bin:$PATH" 
end
