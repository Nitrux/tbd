# tbd

almost test-driven development. almost behavior-driven development. mostly `tbd`.


### goals.

- have a simple tool to run tests.
- simple, yet powerful syntax to describe test suites.
- almost flat learning curve.


### syntax.

```shell
#   you tell tbd what will happen.


on_error pass  # on error continue with the tests.

@ "test my code."
    - "echo yes" prints "yes"
    - "echo no" prints "okay"  # fails.


on_error abort  # exit on error.

@ "break stuff"
    - "false" fails  # this passes.
    - "true" fails   # this one fails.
```

almost the whole syntax is present above (except for stuff that
is equivalent, like `pass` and `ignore`).


### how to.

- write your tests in `./testfile`.
- run `tbd`.
- just chill.


#### custom tests.

if you need to, you can define your own testing routines. you can either
use an external program or just define a function in the `testfile` itself.
`-` has the following syntax:

```
    - action test [results]
```

whenever `test` is not any of `works`, `passes`, `succeeds`, `fails` or
`prints`, `-` will look for a function or command called as the test, e.g.:

```
creates () {
    eval "$1"
    test -e "$3"
}

removes () {
    eval "$1"
    ! test -e "$3"
}

@ "run custom tests."
    - "touch f" creates "f"
    - "rm f" removes "f"
```

`-` will forward __all__ the arguments it received to the test. from the
above example, `creates` will receive the following arguments: `touch f`,
`creates` and `f`. it's up to the implementer how to handle the arguments
forwarded.

a passing test must exit with code 0 (or `return 0` in case it's a function).
any other exit code will be considered a failing test.


### notes.

- by default, `tbd` will try to read from `./testfile`, but you can
  place your tests wherever you want and pass their paths to `tbd`,
  e.g.: `tbd my/tests/*`.

- `-` supports these operands: `works`, `passes`, `succeeds`, `fails`,
  and `prints`. you might guess what they do.

- both `@` and `-` are regular shell functions. `@` prints stuff,
  `-` runs a test.

- by default, `tbd` will exit as soon as an error raises. you can
  override that behavior by writing `on_error continue`, `on_error pass`,
  or `on_error ignore` into the test file. note that it will be evaluated
  when it appears, not before running the tests. to revert to the default
  behavior, use `on_error quit`, `on_error abort` or `on_error die`.

- all changes are done to the current environment. if you want to avoid it,
  run a subshell.
