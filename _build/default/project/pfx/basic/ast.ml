
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
let string_of_command = function
  | Push n -> "Push " ^ string_of_int n
  | Pop -> "Pop"
  | Swap -> "Swap"
  | Nget -> "Nget"
  | Store -> "Store"
  | Load -> "Load"
  | Add -> "Add"
  | Sub -> "Sub"
  | Mul -> "Mul"
  | Div -> "Div"
  | Mod  -> "Mod"
  | Rem -> "Rem"
  | Print -> "Print"

let string_of_program (numargs, cmds) =
  string_of_int numargs ^ ", " ^ 
  "[" ^ String.concat "; " (List.map string_of_command cmds) ^ "]"