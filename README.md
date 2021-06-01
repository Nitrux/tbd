# tbd

![CI](https://github.com/luis-lavaire/tbd/workflows/CI/badge.svg)

> _Test your programs (or scripts)._

## Goals.

- Simple, yet useful.
- Almost flat learning curve (just two functions: `@` and `-`).

## How to.

- Write your tests in `./testfile` (or pass them to `tbd` through the commandline).
- Run `tbd`.

### Syntax.

`tbd` was designed with a very lightweight syntax. It only adds two commands.

`@` has the following syntax:

```shell
@ [message [message...]]
```

`-` has the following syntax:

```shell
- <cmd [args]> <works|fails|prints> [text]
```

This is how a real `testfile` could look like:

```shell
@ "test echo"
  - "echo yes" prints "yes"
  - "echo no" prints "no"
  - "echo" works

@ "other tests"
  - "true" works   # Command exits with exit code 0: The test passes.
  - "false" fails  # A failure was expected: The test passes.
  - "true" fails   # A failure was expected: The test fails.
```
