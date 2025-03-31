# Swish

`swish` is a simple yet powerful command-line tool to automate in Swift.
It's designed to make scripts lightweight, portable, and easy to edit and run.

## Install

You can install Swish using [Mise](https://mise.jdx.dev):

```bash
mise use -g ubi:tuist/swish@latest
```

And then us it directly:

```
swish ./path/to/script.swift
```

Or through the shebang of the script Swift file:

```swift
// ./path/to/script.swift
#!/usr/bin/env swish

print("Hello world!")
```
