use std-rfc/str

# Main description.

# More conrete description.

export def main [
    --name: string  # parameter description
    --sem: int
]: nothing -> nothing {

    mkdir $name
    cd $name
    mkdir "UE/"
    mkdir "VRL/extra/"
    $"
    ---
    sem: sem($sem)
    ---
    "
    | str dedent | save $"($name).md"
    cd "VRL/"
    1..14 | each { |i| header $name $i | save $"($name)-v-w(printf "%02d" $i).md" }
    return
}

def header [name: string, index: int]: nothing -> string {
    let i = if ($index > 1) { $"-v-w($index - 1 | printf "%02d" $in)" }
    let j = if ($index < 14) { $"-v-w($index + 1 | printf "%02d" $in)" }

    $"
    ---
    name: \"[[($name).md]]\"
    prev: \"[[($name)($i).md]]\"
    next: \"[[($name)($j).md]]\"
    tags: note/lecture/($name)
    slides:
    ---


    # Info


    # Topics


    # Notes
    "
    | str dedent
}
