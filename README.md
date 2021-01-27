# tbd

![CI](https://github.com/luis-lavaire/tbd/workflows/CI/badge.svg)

> _Almost test-driven development; almost behavior-driven development._

## Goals.

- Simple, yet powerful tool.
- Almost flat learning curve.
- Works great with shell scripts.

## How to.

- Write your tests in `./testfile`.
- Run `tbd`.

### Syntax.

```shell
@ "@ prints messages."
  - "echo yes" prints "yes"
  - "echo no" prints "no"

@ "break stuff"
  - "false" fails  # the test is expected to fail: the test passes.
  - "true" fails   # the test was expected to work: the test fails.
```


### Custom tests.

You can define your own testing routines. You can either call an external
program or define a function in the `testfile` (remember, `tbd` is embedded
into `bash`, so you can use all of `bash`).

`-` has the following syntax:

```
- action test [results]
```

Whenever `test` is not one of: `works`, `fails` or `prints`, `-` will try
to call it, e.g.:

```
creates () {
    eval "$1"
    test -e "$2"
}

removes () {
    eval "$1"
    ! test -e "$2"
}

@ "run custom tests."
    - ">> a" creates "a"
    - "rm a" removes "a"
```

`-` will forward all its arguments, except for the second one (the command
name). From the above example, `creates` will receive the following
arguments: `>> a` and `a`; `removes` will receive `rm a` and `a`.

A passing test must return `0`; otherwise, it will be considered a failure.


## Notes.

- By default, `tbd` will try to read from `./testfile`, but you can
  place your tests wherever you want and pass their paths to `tbd`,
  e.g.: `tbd tests/*`.

- `-` supports these operands: `works`, `fails`, and `prints`. You might
  guess what they do ;).

- `tbd` exits as soon as an error raises in a `-` invocation.
