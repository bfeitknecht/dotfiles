# Reminder to do something sometime.

export def main[
  time: date
  message?: string
] {
  if (sys host | get name) != "Darwin" {
    error make { msg: "This only works on macOS."
  }
  let now = date now
  sleep ($now + $time)
  osascript -e $"display notification \"($message | default 'Take a break.')\" with title 'Reminder'"
}
