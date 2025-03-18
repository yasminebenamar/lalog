{
  type token =
    | EOF | PUSH | POP | SWAP | NGET | STORE | LOAD
    | ADD | SUB | MUL | DIV | REM | MOD | PRINT
    | INT of int

  let print_token = function
    | EOF -> print_string "EOF"
    | PUSH -> print_string "PUSH"
    | POP -> print_string "POP"
    | SWAP -> print_string "SWAP"
    | NGET -> print_string "NGET"
    | STORE -> print_string "STORE"
    | LOAD -> print_string "LOAD"
    | ADD -> print_string "ADD"
    | SUB -> print_string "SUB"
    | MUL -> print_string "MUL"
    | DIV -> print_string "DIV"
    | REM -> print_string "REM"
    | MOD -> print_string "MOD"
    | PRINT -> print_string "PRINT"
    | INT i -> print_int i

  let mk_int nb =
    try INT (int_of_string nb)
    with Failure _ -> failwith (Printf.sprintf "Illegal integer '%s': " nb)
}

let newline = (['\n' '\r'] | "\r\n")
let blank = [' ' '\014' '\t' '\012']
let not_newline_char = [^ '\n' '\r']
let digit = ['0'-'9']

rule token = parse
  (* newlines *)
  | newline { token lexbuf }
  (* blanks *)
  | blank + { token lexbuf }
  (* end of file *)
  | eof      { EOF }
  (* comments *)
  | "--" not_newline_char*  { token lexbuf }
  (* integers *)
  | digit+ as nb           { mk_int nb }
  (* commands *)
  | "Push" | "push"    { PUSH }
  | "Pop" | "pop"      { POP }
  | "Swap" | "swap"    { SWAP }
  | "Nget" | "nget"    { NGET }
  | "Store" | "store"  { STORE }
  | "Load" | "load"    { LOAD }
  | "Add" | "add"      { ADD }
  | "Sub" | "sub"      { SUB }
  | "Mul" | "mul"      { MUL }
  | "Div" | "div"      { DIV }
  | "Rem" | "rem"      { REM }
  | "Mod" | "mod"      { MOD }
  | "Print" | "print"  { PRINT }
  (* illegal characters *)
  | _    {failwith (Printf.sprintf "Illegal token ")}

{
  let rec examine_all lexbuf =
    let result = token lexbuf in
    print_token result;
    print_string " ";
    match result with
    | EOF -> ()
    | _   -> examine_all lexbuf

  let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    examine_all lexbuf;
    print_newline ();
    close_in (input_file)
  with Sys_error _ ->
       print_endline ("Can't find file '" ^ file ^ "'")

  let _ = Arg.parse [] compile ""
}