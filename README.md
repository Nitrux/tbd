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
- or... run `tbd` plus the location of your test files, and call them whatever you like.
- just chill.
