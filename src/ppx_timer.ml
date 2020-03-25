open Ppxlib

let expander ~loc ~path:_ e =
  let str_of s = Ast_builder.Default.estring ~loc s in
  let int_of i = Ast_builder.Default.eint ~loc i in
  let p = loc.loc_start in
  [%expr
    Timer.start_here
      {
        pos_fname = [%e str_of p.pos_fname];
        pos_lnum = [%e int_of p.pos_lnum];
        pos_bol = [%e int_of p.pos_bol];
        pos_cnum = [%e int_of p.pos_cnum];
      };
    let __timer_v = [%e e] in
    Timer.stop ();
    __timer_v]

let timer_rule =
  Context_free.Rule.extension
  @@ Extension.declare "timer" Extension.Context.expression
       Ast_pattern.(single_expr_payload __)
       expander

let () = Driver.register_transformation "timer" ~rules:[ timer_rule ]
