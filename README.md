# Swish

`swish` is a simple yet powerful command-line tool to automate in Swift.
It's designed to make scripts lightweight, portable, and easy to edit and run.

## Usage

Install Swish using [Mise](https://mise.jdx.dev):

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

struct Script {
  static func main() async throws {
    print("Hello world")
  }
}

#if SWISH_MAIN
  await Script.main()
#endif
```

> [!NOTE]
> Swish files can be both, executable and libraries. Therefore, you should follow two important conventions:
>   1. Wrap the executable logic using the `SWISH_MAIN` compiler directive.
>   2. Namespace the business logic using a struct with a unique name.
