if status is-interactive

    # initialize z
    zoxide init fish | source
    source $__fish_config_dir/abbreviations.fish
end


############################################################################

## now happens automatically because of fisher_path plugin
# !!
# set -gx fisher_path ~/.config/fish/plugins
# source $fisher_path/functions/fisher.fish


source $__fish_config_dir/alias.fish



# add function subdirs to fish_function_path
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
# add completion subdirs to fish_completion_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path







# set $EDITOR to micro
set -gx EDITOR micro

set -gx VISUAL micro


# set brew to automatically autoremove unused dependencies
set -gx HOMEBREW_NO_ENV_HINTS true

set -gx LESSHISTFILE -


set -gx fish_greeting ""

# man needs this
set -gx MANPAGER "less -# .1 -M -J --status-line --incsearch +Gg"
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"


############################################################################







# delete microsoft auto updater
# sudo rm -rf /Library/Caches/com.microsoft.autoupdate.fba \
#                /Library/Caches/com.microsoft.autoupdate.helper \
#                /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist \
#                /Library/Preferences/com.microsoft.autoupdate2.plist \
#                /Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper

# delete microsoft licensing helper:
# sudo rm -rf /Library/LaunchDaemons/com.microsoft. ## something licensing something


