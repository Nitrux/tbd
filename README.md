# tbd

![CI](https://github.com/luislavaire/tbd/workflows/CI/badge.svg)

> _Test your programs._

## Goals.

- Simple, yet useful.
- Almost flat learning curve (just three functions: `@`, `+` and `-`).

### Syntax.

`tbd` was designed with a very lightweight syntax in mind. It only has two commands.

```
@ [message]             # Print a message to the screen.
- "<cmd> [args]" works  # Run a test that is expected to exit with code 0.
- "<cmd> [args]" fails  # Run a test that is expected to exit with code greater than 0.
```

This is how a real `testfile` could look like:

```shell
@ Test something.
  - true works
  - false fails
```

## How to.

- Write your tests in `./testfile`.
- Run `tbd` in the same directory where your `testfile` is.
