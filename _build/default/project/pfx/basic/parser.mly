%{
  open Ast
%}

%token EOF
%token <int> INT
%token PUSH
%token POP
%token SWAP 
%token STORE
%token LOAD
%token ADD
%token SUB
%token MUL
%token DIV
%token REM
%token MOD
%token PRINT


%start program 
%type <Ast.program> program

%%




program:
  | INT command_list EOF { $1, $2 }     


command_list:
  | /* Empty */ { [] }         
  | command command_list { $1 :: $2 }  

command:
  | PUSH INT { Push $2 }
  | POP { Pop }
  | SWAP { Swap }
  | STORE { Store }
  | LOAD { Load }
  | ADD { Add }
  | SUB { Sub }
  | MUL { Mul }
  | DIV { Div }
  | REM { Rem }
  | MOD { Mod }
  | PRINT { Print }

%%
