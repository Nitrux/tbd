# tbd

> _Test your programs._

A simple program for testing programs, with minimal syntax.
It runs atop `bash`, so you can use all of it.

## Usage.

Write your tests in a file called `testfile` and run `tbd` in
the same directory where your `testfile` is.

```
 $ pwd
/home/me/dev/tbd
 $ ls
LICENSE  README.md  tbd  testfile
 $ tbd
- true
- false
 ^ fail ($? = 1).
- return 4
 ^ fail ($? = 4).
- echo okay
- echo your home is at /home/me.
```

`tbd` exports just one function: `-`, which runs a test:

```
- '<cmd> [args]'
```

By default, `tbd` will continue running tests when it finds an error.
If want it to abort on error, just set the variable `TBD_ERREXIT`
to any non-empty value.

This is how a real `testfile` could look like:

```shell
- 'echo "Hi there!"'
- 'false'       # This error will not result in abortion.

TBD_ERREXIT=1   # Errors will now result on abortion.
- 'false'       # tbd exits.
- 'echo "This will not be printed."'
```
