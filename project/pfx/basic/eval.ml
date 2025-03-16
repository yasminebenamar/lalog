open Ast
open Printf

let string_of_stack stack = sprintf "[%s]" (String.concat ";" (List.map string_of_int stack))

let string_of_state (cmds,stack) =
  (match cmds with
   | [] -> "no command"
   | cmd::_ -> sprintf "executing %s" (string_of_command cmd))^
    (sprintf " with stack %s" (string_of_stack stack))

(* Question 4.2 *)

let step state = 
  match state with
  | [], _ -> Error("Nothing to step", state)
  
  | Push n :: q, stack -> 
      Ok(q, n :: stack)
  
  | Pop :: q, _ :: stack -> 
      Ok(q, stack)
  | Pop :: _, [] -> 
      Error("Pop on empty stack", state)
  
  | Swap :: q, a :: b :: stack -> 
      Ok(q, b :: a :: stack)
  | Swap :: _, _ -> 
      Error("Not enough values to swap", state)
  
  | Nget :: q, n :: stack ->
      if n < 0 || n >= List.length stack then
        Error("Nget index out of bounds", state)
      else
        Ok(q, (List.nth stack n) :: stack)
  | Nget :: _, [] ->
      Error("Nget on empty stack", state)
  
  | Store :: q, addr :: value :: stack ->
      (* Assuming memory is represented as part of the state which isn't shown here.
         This would need to be modified based on your actual memory model. *)
      Error("Store not implemented in this simplified model", state)
  | Store :: _, _ ->
      Error("Not enough values for store", state)
  
  | Load :: q, addr :: stack ->
      (* Similar to Store, this requires a memory model *)
      Error("Load not implemented in this simplified model", state)
  | Load :: _, [] ->
      Error("Load on empty stack", state)
  
  | Add :: q, b :: a :: stack ->
      Ok(q, (a + b) :: stack)
  | Add :: _, _ ->
      Error("Not enough values for addition", state)
  
  | Sub :: q, b :: a :: stack ->
      Ok(q, (a - b) :: stack)
  | Sub :: _, _ ->
      Error("Not enough values for subtraction", state)
  
  | Mul :: q, b :: a :: stack ->
      Ok(q, (a * b) :: stack)
  | Mul :: _, _ ->
      Error("Not enough values for multiplication", state)
  
  | Div :: q, 0 :: _ :: _ ->
      Error("Division by zero", state)
  | Div :: q, b :: a :: stack ->
      Ok(q, (a/b) :: stack)
  | Div :: _, _ ->
      Error("Not enough values for division", state)
  
  | Print :: q, a :: stack ->
      print_int a;
      print_newline();
      Ok(q, a :: stack)  (* Print doesn't consume the value *)
  | Print :: _, [] ->
      Error("Print on empty stack", state)



let eval_program (numargs, cmds) args =
  let rec execute = function
    | [], []    -> Ok None
    | [], v::_  -> Ok (Some v)
    | state ->
       begin
         match step state with
         | Ok s    -> execute s
         | Error e -> Error e
       end
  in
  if numargs = List.length args then
    match execute (cmds,args) with
    | Ok None -> printf "No result\n"
    | Ok(Some result) -> printf "= %i\n" result
    | Error(msg,s) -> printf "Raised error %s in state %s\n" msg (string_of_state s)
  else printf "Raised error \nMismatch between expected and actual number of args\n"
