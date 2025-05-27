# Reminder to do something sometime.

export def main [
    time: duration
    message?: string
]: nothing -> nothing {

    if (sys host | get name) != "Darwin" {
        error make { msg: "This only works on macOS." }
    }
    let now = date now
    if ($now + $time) < $now {
        error make { msg: "Time must be in the future." }
    }
    sleep $time
    let msg = $"($message | default 'Take a break.')"
    let command = $"display notification \"($msg)\" with title \"Reminder\""
    ^osascript -e $command
}
