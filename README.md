# ppx_timer

ppx for [timer](https://github.com/skcho/timer)

## install

```
opam pin add ppx_timer https://github.com/skcho/ppx_timer.git
```

## example

`[%timer exp]` is expanded to

```ocaml
Timer.start_here [%here];
let v = exp in
Timer.stop ();
v
```
to calculate the evaluation time of exp.

See [test.ml](test/test.ml) for examples.
