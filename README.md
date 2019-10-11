# Arch Lisp October 2019 - Racket Stacker DSL Tutorial

https://beautifulracket.com/stacker/intro.html

## Let's install Racket.

```
brew install racket
```

Scheme and Racket in Emacs:

http://www.nongnu.org/geiser/

```
M-x package-install RET geiser RET
```

It's b0rk3n!

https://github.com/jaor/geiser/issues/39

```
raco pkg install compatibility-lib
```

It worked!

```
raco pkg install sicp
```

We need `beautiful-racket` for `br/*` stuff.

```
raco pkg install beautiful-racket
```

## Starting Geiser in Emacs

`C-c C-z` to launch your REPL from one of the rkt files.

`C-c C-k` to compile and load your file in the repl.

`C-x C-e` will evaluate the form and show it in the debug buffer.

`C-c C-c` will evaluate the form and show in the Emacs gutter.

Geiser Cheat Sheet: http://www.nongnu.org/geiser/geiser_5.html
