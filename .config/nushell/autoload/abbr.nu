# Defines custom abbreviations.

let abbreviations = {
  brug: "brew upgrade --greedy"
  brcl: "brew cleanup --prune=all"
  nv: "nvim"
}

$env.config.menus = [
  {
    name: abbr_menu
    only_buffer_difference: false
    marker: none
    type: {
        layout: columnar
        columns: 1
        col_width: 20
        col_padding: 2
    }
    style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
    }
    source: { |buffer, position|
        let match = $abbreviations | columns | where $it == $buffer
        if ($match | is-empty) {
            { value: $buffer }
        } else {
            { value: ($abbreviations | get $match.0) }
        }
    }
  }
]

