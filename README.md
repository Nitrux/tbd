# tbd

> _Test your programs._

A simple program for testing programs. It exposes a minimal
syntax. It runs atop `bash`, so you can use all of it.

## Usage.

Write your tests in a file called `testfile` and run `tbd` in
the same directory where your `testfile` is.

`tbd` exports just one function: `-`, which runs a test:

```
- '<cmd> [args]'
```

By default, `tbd` will continue running tests if it finds an error.
However, if you'd like it to abort on error, just set `TBD_ERREXIT`
to any non-empty value.

This is how a real `testfile` could look like:

```shell
- 'echo "Hi there!"'
- 'false'       # This will not abort the test suite.

TBD_ERREXIT=1   # Errors will now result on abortion.
- 'false'       # tbd exits.
- 'echo "This will not be printed."'
```
