# tbd

![CI](https://github.com/luislavaire/tbd/workflows/CI/badge.svg)

> _Test your programs (or scripts)._

## Goals.

- Simple, yet useful.
- Almost flat learning curve (just three functions: `@`, `+` and `-`).

### Syntax.

`tbd` was designed with a very lightweight syntax in mind. It only has three commands.

```
@ [message]     # Print a message.
+ <cmd> [args]  # Run a test that is expected to pass (exit with code 0).
- <cmd> [args]  # Run a test that is expected to fail (exit with code >0).
```

This is how a real `testfile` could look like:

```shell
@ Test tbd.
  + true
  - false
```

## How to.

- Write your tests in `./testfile`.
- Run `tbd`.
