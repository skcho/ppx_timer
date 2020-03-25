let do_sth () =
  let rec f n = if n < 0 then () else f (n - 1) in
  f 500000000

(* [%timer exp] is expanded to

   Timer.start_here <location>;
   let v = exp in
   Timer.stop ();
   v

   to calculate the evaluation time of exp. *)
let ppx_timer () =
  if [%timer do_sth ()] <> () then [%timer do_sth ()] else [%timer do_sth ()];
  Timer.flush ()

let test title f =
  prerr_endline ("TEST: " ^ title);
  f ();
  prerr_newline ()

let () = test "ppx_timer" ppx_timer
