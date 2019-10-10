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

## Starting Geiser in Emacs

1. Nevermind, just do `M-x run-racket` instead.
2. Evaluate at the REPL: `,enter "stacker.rkt"`
3. From then on you can `C-x C-e` to load a single form.
