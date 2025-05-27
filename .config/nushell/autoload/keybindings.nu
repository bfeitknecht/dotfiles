# Defines custom keybindings.

$env.config.keybindings = [
  {
      name: "clear_screen"
      modifier: "alt"
      keycode: "Char_k"
      mode: [emacs, vi_normal, vi_insert]
      event: { 
        send: executehostcommand
        cmd: "^clear"
      }
        
  }
  {
    name: "prev_dir"
    modifier: "alt"
    keycode: "Char_-"
    mode: [emacs, vi_normal, vi_insert]
    event: { 
      send: executehostcommand
      cmd: "cd -"
    }
      
  }
  {
    name: "up_dir"
    modifier: "alt"
    keycode: "Char_."
    mode: [emacs, vi_normal, vi_insert]
    event: { 
      send: executehostcommand
      cmd: "cd .."
    }
      
  }
  {
    name: "home_dir"
    modifier: "alt"
    keycode: "Char_,"
    mode: [emacs, vi_normal, vi_insert]
    event: { 
      send: executehostcommand
      cmd: "cd ~"
    }
      
  }
  {
# not happy with it
    name: "ls_token"
    modifier: "alt"
    keycode: "Char_l"
    mode: [emacs, vi_normal, vi_insert]
    event: {
      send: executehostcommand
      cmd: "((ls | get name) | to text)"
    }
  }
]







# abbreviaitons menu, broken on !! and !$ alias with space
# also on enter

#  {
#    name: abbr_menu
#    modifier: none
#    keycode: enter
#    mode: [emacs, vi_normal, vi_insert]
#    event: [
#        { send: menu name: abbr_menu }
#        { send: enter }
#    ]
#  }
#
#  {
#    name: abbr_menu
#    modifier: none
#    keycode: space
#    mode: [emacs, vi_normal, vi_insert]
#    event: [
#        { send: menu name: abbr_menu }
#        { edit: insertchar value: ' ' }
#    ]
#  }

