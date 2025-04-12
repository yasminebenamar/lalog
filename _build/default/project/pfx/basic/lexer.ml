# 1 "project/pfx/basic/lexer.mll"
 
  open Parser
  
 

  let print_token = function
    | EOF -> print_string "EOF"
    | PUSH -> print_string ("PUSH ")
    | POP -> print_string "POP"
    | SWAP -> print_string "SWAP"
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
    with Failure _ -> raise (Failure (Printf.sprintf "Illegal integer '%s'" nb))


# 32 "project/pfx/basic/lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\241\255\000\000\001\000\000\000\001\000\000\000\002\000\
    \003\000\004\000\005\000\007\000\004\000\008\000\015\000\017\000\
    \036\000\255\255\002\000\010\000\015\000\006\000\253\255\252\255\
    \023\000\019\000\242\255\031\000\025\000\023\000\035\000\030\000\
    \025\000\000\000\031\000\002\000\031\000\251\255\030\000\044\000\
    \250\255\247\255\048\000\036\000\051\000\037\000\036\000\050\000\
    \055\000\053\000\249\255\057\000\055\000\056\000\248\255\057\000\
    \058\000\051\000\246\255\243\255\060\000\053\000\044\000\245\255\
    \045\000\055\000\244\255\056\000";
  Lexing.lex_backtrk =
   "\255\255\255\255\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \001\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\000\000\000\000\
    \255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\255\255\255\255\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\255\255\000\000\255\255\
    \255\255\255\255\000\000\000\000\255\255\255\255\255\255\000\000\
    \255\255\255\255\000\000\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\017\000\017\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \017\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\009\000\000\000\000\000\005\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\011\000\007\000\000\000\000\000\
    \015\000\000\000\003\000\013\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\000\000\000\000\
    \000\000\008\000\041\000\036\000\004\000\067\000\065\000\055\000\
    \053\000\064\000\062\000\024\000\010\000\006\000\022\000\060\000\
    \014\000\056\000\002\000\012\000\051\000\061\000\048\000\057\000\
    \043\000\042\000\023\000\044\000\034\000\033\000\028\000\035\000\
    \019\000\027\000\021\000\018\000\029\000\025\000\020\000\026\000\
    \031\000\023\000\030\000\022\000\032\000\026\000\038\000\037\000\
    \039\000\040\000\041\000\046\000\045\000\037\000\047\000\040\000\
    \049\000\050\000\052\000\050\000\054\000\054\000\059\000\058\000\
    \059\000\058\000\063\000\063\000\066\000\066\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\000\000\255\255\255\255\
    \000\000\255\255\000\000\000\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\255\255\255\255\
    \255\255\000\000\033\000\035\000\000\000\002\000\003\000\008\000\
    \009\000\004\000\005\000\018\000\000\000\000\000\021\000\006\000\
    \000\000\007\000\000\000\000\000\010\000\006\000\011\000\007\000\
    \012\000\012\000\019\000\012\000\013\000\013\000\014\000\013\000\
    \015\000\014\000\020\000\015\000\014\000\024\000\015\000\025\000\
    \027\000\028\000\029\000\030\000\031\000\032\000\034\000\036\000\
    \038\000\039\000\042\000\043\000\044\000\045\000\046\000\047\000\
    \048\000\049\000\051\000\052\000\053\000\055\000\056\000\057\000\
    \060\000\061\000\062\000\064\000\065\000\067\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 37 "project/pfx/basic/lexer.mll"
                    ( token lexbuf )
# 167 "project/pfx/basic/lexer.ml"

  | 1 ->
let
# 38 "project/pfx/basic/lexer.mll"
                  nb
# 173 "project/pfx/basic/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 38 "project/pfx/basic/lexer.mll"
                     ( INT (int_of_string nb) )
# 177 "project/pfx/basic/lexer.ml"

  | 2 ->
# 39 "project/pfx/basic/lexer.mll"
                    ( PUSH )
# 182 "project/pfx/basic/lexer.ml"

  | 3 ->
# 40 "project/pfx/basic/lexer.mll"
                  ( POP )
# 187 "project/pfx/basic/lexer.ml"

  | 4 ->
# 41 "project/pfx/basic/lexer.mll"
                    ( SWAP )
# 192 "project/pfx/basic/lexer.ml"

  | 5 ->
# 42 "project/pfx/basic/lexer.mll"
                      ( STORE )
# 197 "project/pfx/basic/lexer.ml"

  | 6 ->
# 43 "project/pfx/basic/lexer.mll"
                    ( LOAD )
# 202 "project/pfx/basic/lexer.ml"

  | 7 ->
# 44 "project/pfx/basic/lexer.mll"
                  ( ADD )
# 207 "project/pfx/basic/lexer.ml"

  | 8 ->
# 45 "project/pfx/basic/lexer.mll"
                  ( SUB )
# 212 "project/pfx/basic/lexer.ml"

  | 9 ->
# 46 "project/pfx/basic/lexer.mll"
                  ( MUL )
# 217 "project/pfx/basic/lexer.ml"

  | 10 ->
# 47 "project/pfx/basic/lexer.mll"
                  ( DIV )
# 222 "project/pfx/basic/lexer.ml"

  | 11 ->
# 48 "project/pfx/basic/lexer.mll"
                  ( REM )
# 227 "project/pfx/basic/lexer.ml"

  | 12 ->
# 49 "project/pfx/basic/lexer.mll"
                  ( MOD )
# 232 "project/pfx/basic/lexer.ml"

  | 13 ->
# 50 "project/pfx/basic/lexer.mll"
                      ( PRINT )
# 237 "project/pfx/basic/lexer.ml"

  | 14 ->
let
# 51 "project/pfx/basic/lexer.mll"
         c
# 243 "project/pfx/basic/lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 51 "project/pfx/basic/lexer.mll"
           ( raise (Failure (Printf.sprintf "Illegal character '%c'" c)) )
# 247 "project/pfx/basic/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

# 54 "project/pfx/basic/lexer.mll"
 
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

# 277 "project/pfx/basic/lexer.ml"
