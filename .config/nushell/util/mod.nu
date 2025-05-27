# Utility module.

# Defines some useful commands.

# Show `str` with `ansi default` and trailing space.
export def show [str: string] { $"(ansi default)($str)(char space)(ansi reset)" }

# Replicate for `n` times `str`.
export def replicate [n: int, str: string] { "" | fill -c $str -w $n }

export use ./vrl.nu
export use ./qr-code.nu
export use ./reminder.nu
