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

set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
# set -gx FZF_DEFAULT_OPTS ""

set -gx fzf_fd_opts --hidden --max-depth 5

set -gx fzf_preview_dir_cmd "lsd -1 --almost-all --icon=never --color=always"
set -gx fzf_preview_file_cmd "bat --paging=never \
    --style=plain,numbers,changes,rule,snip \
    --decorations=always --color=always"
    

# set -gx fzf_directory_opts ""
# set -gx fzf_git_log_opts ""
# set -gx fzf_git_status_opts ""
# set -gx fzf_history_opts ""
# set -gx fzf_processes_opts ""
# set -gx fzf_variables_opts ""


# set fzf_git_log_format "%H %s"
# set fzf_diff_highlighter delta --paging=never --width=20
