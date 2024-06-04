# add function subdirs to fish_function_path
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
# add completion subdirs to fish_completion_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path


set -gx EDITOR micro
set -gx VISUAL micro

# i'm not stupid
set -gx HOMEBREW_NO_ENV_HINTS true
set -gx LESSHISTFILE -
set -gx fish_greeting ""

# man needs this
set -gx MANPAGER "less -# .1 -M -J --status-line --incsearch +Gg"
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
