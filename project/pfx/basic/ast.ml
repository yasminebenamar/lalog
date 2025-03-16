type command =
  DefineMe (* Question 4.1 *)

type program = int * command list

(* add here all useful functions and types  related to the AST: for instance  string_of_ functions *)


type command =

  | Push of int      (* Empile une valeur *)
  | Pop              (* Dépile la valeur du sommet *)
  | Swap             (* Échange les deux valeurs du sommet *)
  
  | Store            (* Stocke une valeur en mémoire *)
  | Load             (* Charge une valeur depuis la mémoire *)
  | Nget             (* Récupère la nième valeur de la pile *)
  
  | Add              (* Addition *)
  | Sub              (* Soustraction *)
  | Mul              (* Multiplication *)
  | Div              (* Division *)
    
  | Print            (* Affiche la valeur du sommet *)



let string_of_command = function
  | _ -> "to be done"

let string_of_commands cmds = String.concat " " (List.map string_of_command cmds)

let string_of_program (args, cmds) = Printf.sprintf "%i args: %s\n" args (string_of_commands cmds)

