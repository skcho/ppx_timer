# ppx_timer

Ppx for [timer](https://github.com/skcho/timer)

## Install

```
opam pin add ppx_timer https://github.com/skcho/ppx_timer.git
```

## Example

`[%timer exp]` is expanded to

```ocaml
Timer.start_here <pos:Lexing.position>;
let v = exp in
Timer.stop ();
v
```

to calculate the evaluation time of exp.  See [test](test/ppx_timer_test.ml) for examples.
