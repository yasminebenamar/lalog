(* The type of the commands for the stack machine *)
type command =
  | Push of int    (* Push a constant onto the stack *)
  | Pop            (* Remove the top element from the stack *)
  | Swap           (* Swap the top two elements of the stack *)
  | Nget           (* Get the nth element from the stack *)
  | Store          (* Store a value at a memory location *)
  | Load           (* Load a value from a memory location *)
  | Add            (* Add the top two elements *)
  | Sub            (* Subtract the top element from the second element *)
  | Mul            (* Multiply the top two elements *)
  | Div            (* Divide the second element by the top element *)
  | Rem    (* Nouveau constructeur pour le modulo *)
  | Mod
  | Print          (* Print the top element without removing it *)

(* The type for programs *)
type program = int * command list

(* Converting a command to a string for printing *)
val string_of_command : command -> string

(* Converting a program to a string for printing *)
val string_of_program : program -> string