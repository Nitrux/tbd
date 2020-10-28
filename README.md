# tbd

almost test-driven development. almost behavior-driven development. mostly `tbd`.


#### goals.

- have a simple tool to run tests.
- simple, yet powerful syntax to describe test suites.
- almost flat learning curve.


#### syntax.

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


#### how to.

- write your tests in `./testfile`.
- run `tbd`.
- just chill.

by default, `tbd` will try to read from `./testfile`, but you can
place your tests wherever you want and pass their paths to `tbd`,
e.g.: `tbd my/tests/*`.

by default, `tbd` will exit as soon as an error raises. you can
override that behavior by writing `on_error continue`, `on_error pass`,
or `on_error ignore`.

both `@` and `-` are regular shell functions. `@` prints stuff,
`-` runs a test.

`-` supports these operands: `works`, `passes`, `succeeds`, `fails`,
and `prints`. they do what you may guess.
