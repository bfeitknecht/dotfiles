# Configure the left and right prompt. 

$env.PROMPT_COMMAND = { left-prompt }
$env.PROMPT_COMMAND_RIGHT = { right-prompt }
$env.PROMPT_INDICATOR_VI_NORMAL = { show "$" } 
$env.PROMPT_INDICATOR_VI_INSERT = { show ":" }
$env.PROMPT_MULTILINE_INDICATOR = { show "..." } 

$env.TRANSIENT_PROMPT_COMMAND = ""
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = ""
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = { show "$" }
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = { show "$" }
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = { replicate 3 (char space) } 


# Create the left propmt.
export def left-prompt [] {
  # user@host:cwd
  #
  if ($env.TMUX? | is-empty) {
    let host = (hostname)
    let cwd = (pwd) | str replace $env.HOME "~"
    $"(ansi default)($env.USER)@($host):($cwd)(ansi reset)\n"
  }
}

# Create the right prompt.
export def right-prompt [] {
  # (branch:-)
  if ($env.TMUX? | is-empty) {
    #$"(date now | format date '%m/%d/%Y %I:%M:%S%.3f')"
  }
}

