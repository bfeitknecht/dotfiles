# misc
abbr :q exit
abbr :e micro

##################
# maybe add this as alias?
# abbr brug abbr brug 'brew upgrade --greedy --dry-run;
#   read -P "Upgrade all? [Y/n]: " choice;
#   test -z "$choice";
#   or test "$choice" = "y" -o "$choice" = "Y";
#   and brew upgrade --greedy'

abbr brug 'brew upgrade --greedy'
abbr brcl 'brew cleanup --prune all'
abbr brdp 'brew deps --tree (brew leaves)'
abbr nv 'nvim'


# git related
abbr gco 'git checkout'
abbr gs 'git status -sb'
abbr gsl 'git lg -5'
abbr ga 'git add .'
abbr gc 'git commit'
abbr gca 'git commit --amend'
abbr gcan 'git commit --amend --no-edit'      # could probably do this better with positional
abbr gps 'git push --verbose'
abbr gpl 'git pull --rebase --verbose'

# extra functions
abbr ev echo-variable
