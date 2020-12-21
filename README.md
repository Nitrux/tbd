# tbd

![CI](https://github.com/luis-lavaire/tbd/workflows/CI/badge.svg)

> _almost test-driven development; almost behavior-driven development._

## goals.

- simple tool to run tests.
- simple yet powerful syntax.
- almost flat learning curve.
- works great with shell scripts.

## how to.

- write your tests in `./testfile`.
- run `tbd`.

### syntax.

```shell
@ "test my code."  # '@' prints a message.
  - "echo yes" prints "yes"
  - "echo no" prints "no"

on_error continue  # ignore errors.
on_error abort     # exit on error (default).

@ "break stuff"
  - "false" fails  # the test is expected to fail: this works.
  - "true" fails   # the test was expected to work: this one fails.
```


### custom tests.

you can define your own testing routines. you can either call an external
program or define a function in the `testfile` (remember, `tbd` is embedded
into `bash`, so you can use all of `bash`).

`-` has the following syntax:

```
- action test [results]
```

whenever `test` is not any of `works`, `fails` or `prints`, `-` will try
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

`-` will forward to the test all the arguments it received, except for the
second one (the command name). from the above example, `creates` will receive
the following arguments: `>> a` and `a`; `removes` will receive `rm a` and `a`.

a passing test must return `0`, otherwise it will be considered a failure.


## notes.

- by default, `tbd` will try to read from `./testfile`, but you can
  place your tests wherever you want and pass their paths to `tbd`,
  e.g.: `tbd tests/*`.

- `-` supports these operands: `works`, `fails`, and `prints`. you might
  guess what they do.

- by default, `tbd` will exit as soon as an error raises. you can
  override that behavior by writing `on_error continue` into the test file.
  note that it will be evaluated when it appears, not before running the
  tests. to revert to the default behavior, use `on_error quit` or
  `on_error abort`.
