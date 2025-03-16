open Ast



(* Type représentant les opérations arithmétiques *)
type expression =
  | Const of int
  | Var of string
  | Binop of BinOp.t * expression * expression
  | Uminus of expression

(* Fonction generate pour traduire une expression en Pfx *)
let rec generate expr =
  match expr with
  | Const n -> ["Push " ^ string_of_int n]  (* Pousser une constante sur la pile *)
  | Var x -> failwith "Variables not yet implemented in this version"  (* Les variables nécessitent une gestion spéciale *)
  | Binop (Badd, e1, e2) -> generate e1 @ generate e2 @ ["Add"]
  | Binop (Bsub, e1, e2) -> generate e1 @ generate e2 @ ["Sub"]
  | Binop (Bmul, e1, e2) -> generate e1 @ generate e2 @ ["Mul"]
  | Binop (Bdiv, e1, e2) -> generate e1 @ generate e2 @ ["Div"]
  | Binop (Bmod, e1, e2) -> generate e1 @ generate e2 @ ["Rem"]
  | Uminus e -> generate e @ ["Push 0"; "Sub"]  (* Négation d'une expression en soustrayant de zéro *)
