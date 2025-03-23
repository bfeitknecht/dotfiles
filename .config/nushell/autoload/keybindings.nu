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








  # abbreviaitons menu, broken on !! and !$ alias with space and spce alone also 
  {
    name: abbr_menu
    modifier: none
    keycode: enter
    mode: [emacs, vi_normal, vi_insert]
    event: [
        { send: menu name: abbr_menu }
        { send: enter }
    ]
  }
  {
    name: abbr_menu
    modifier: none
    keycode: space
    mode: [emacs, vi_normal, vi_insert]
    event: [
        { send: menu name: abbr_menu }
        { edit: insertchar value: ' '}
    ]
  }
]

