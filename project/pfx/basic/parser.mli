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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
