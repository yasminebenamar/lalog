open Ast
(* Import the BasicPfx module to access its Ast types *)
open BasicPfx.Ast



(* Fonction generate pour traduire une expression en Pfx *)
let rec generate (expr : Ast.expression) : BasicPfx.Ast.command list =
  match expr with
  | Const n -> [Push n]
  | Var _ -> failwith "Variables not supported in this basic implementation" 
  | Binop (Badd, e1, e2) -> (generate e1) @ (generate e2) @ [BasicPfx.Ast.Add]
  | Binop (Bsub, e1, e2) -> (generate e1) @ (generate e2) @ [BasicPfx.Ast.Sub]
  | Binop (Bmul, e1, e2) -> (generate e1) @ (generate e2) @ [BasicPfx.Ast.Mul]
  | Binop (Bdiv, e1, e2) -> (generate e1) @ (generate e2) @ [BasicPfx.Ast.Div]
  | Binop (Bmod, e1, e2) -> (generate e1) @ (generate e2) @ [BasicPfx.Ast.Mod]
  | Uminus e -> [Push 0] @ generate e @ [ BasicPfx.Ast.Sub]  
