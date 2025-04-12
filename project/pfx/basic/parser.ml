type token =
  | EOF
  | INT of (int)
  | PUSH
  | POP
  | SWAP
  | NGET
  | STORE
  | LOAD
  | ADD
  | SUB
  | MUL
  | DIV
  | REM
  | MOD
  | LPAR
  | RPAR
  | COMMA
  | PRINT

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Ast
# 26 "parser.ml"
let yytransl_const = [|
    0 (* EOF *);
  258 (* PUSH *);
  259 (* POP *);
  260 (* SWAP *);
  261 (* NGET *);
  262 (* STORE *);
  263 (* LOAD *);
  264 (* ADD *);
  265 (* SUB *);
  266 (* MUL *);
  267 (* DIV *);
  268 (* REM *);
  269 (* MOD *);
  270 (* LPAR *);
  271 (* RPAR *);
  272 (* COMMA *);
  273 (* PRINT *);
    0|]

let yytransl_block = [|
  257 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\000\000"

let yylen = "\002\000\
\003\000\000\000\002\000\002\000\001\000\001\000\002\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\017\000\000\000\005\000\006\000\000\000\
\008\000\009\000\010\000\011\000\012\000\013\000\014\000\015\000\
\016\000\000\000\000\000\004\000\007\000\001\000\003\000"

let yydgoto = "\002\000\
\004\000\018\000\019\000"

let yysindex = "\011\000\
\012\255\000\000\254\254\000\000\013\255\000\000\000\000\015\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\017\000\254\254\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\018\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\018\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\001\000\000\000"

let yytablesize = 20
let yytable = "\005\000\
\006\000\007\000\008\000\009\000\010\000\011\000\012\000\013\000\
\014\000\015\000\016\000\001\000\003\000\020\000\017\000\021\000\
\022\000\002\000\000\000\023\000"

let yycheck = "\002\001\
\003\001\004\001\005\001\006\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\001\000\001\001\001\001\017\001\001\001\
\000\000\000\000\255\255\019\000"

let yynames_const = "\
  EOF\000\
  PUSH\000\
  POP\000\
  SWAP\000\
  NGET\000\
  STORE\000\
  LOAD\000\
  ADD\000\
  SUB\000\
  MUL\000\
  DIV\000\
  REM\000\
  MOD\000\
  LPAR\000\
  RPAR\000\
  COMMA\000\
  PRINT\000\
  "

let yynames_block = "\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'command_list) in
    Obj.repr(
# 34 "parser.mly"
                         ( _1, _2 )
# 125 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
                ( [] )
# 131 "parser.ml"
               : 'command_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'command) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'command_list) in
    Obj.repr(
# 39 "parser.mly"
                         ( _1 :: _2 )
# 139 "parser.ml"
               : 'command_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 42 "parser.mly"
             ( Push _2 )
# 146 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
        ( Pop )
# 152 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 44 "parser.mly"
         ( Swap )
# 158 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 45 "parser.mly"
             ( Nget _2 )
# 165 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parser.mly"
          ( Store )
# 171 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
         ( Load )
# 177 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "parser.mly"
        ( Add )
# 183 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
        ( Sub )
# 189 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
        ( Mul )
# 195 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
        ( Div )
# 201 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
        ( Rem )
# 207 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
        ( Mod )
# 213 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
          ( Print )
# 219 "parser.ml"
               : 'command))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
;;
