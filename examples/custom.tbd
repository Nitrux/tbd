creates () {
    eval "$1"
    test -f "$3"
}

removes () {
    eval "$1"
    ! test -e "$3"
}

@ "run custom tests."
    - "touch f" creates "f"
    - "rm f" removes "f"
