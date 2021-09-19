# tbd

> _Test your programs._

## Goals.

- Simple, yet useful.
- Almost flat learning curve (it's just two functions: `@` and `-`).

### Syntax.

`tbd` was designed with a very lightweight syntax in mind.
It only has two commands: `@` to print messages (headers), and `-` to run a test.

```
@ [message]             # Print a message to the screen.
- '<cmd> [args]' works  # Run a test that exits 0.
- '<cmd> [args]' fails  # Run a test that exits greater than 0.
```

This is how a real `testfile` could look like:

```shell
@ Test something.
  - 'true'  works
  - 'false' fails
```

## How to.

Write your tests in a file called `testfile` and run `tbd` in the same directory where your `testfile` is.
