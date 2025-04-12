
module MenhirBasics = struct
  
  exception Error
  
  let _eRR : exn =
    Error
  
  type token = 
    | SWAP
    | SUB
    | STORE
    | REM
    | PUSH of (
# 7 "pfx/basic/parser.mly"
       (int)
# 18 "pfx/basic/parser.ml"
  )
    | PRINT
    | POP
    | MUL
    | MOD
    | LOAD
    | INT of (
# 6 "pfx/basic/parser.mly"
       (int)
# 28 "pfx/basic/parser.ml"
  )
    | EOF
    | DIV
    | ADD
  
end

include MenhirBasics

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState17
  | MenhirState1

# 1 "pfx/basic/parser.mly"
  
  open Ast

# 53 "pfx/basic/parser.ml"

let rec _menhir_goto_command_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.command list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, (_1 : (
# 6 "pfx/basic/parser.mly"
       (int)
# 70 "pfx/basic/parser.ml"
            ))), _, (_2 : (Ast.command list))) = _menhir_stack in
            let _v : (Ast.program) = 
# 30 "pfx/basic/parser.mly"
                         ( _1, _2 )
# 75 "pfx/basic/parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.program)) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.command))), _, (_2 : (Ast.command list))) = _menhir_stack in
        let _v : (Ast.command list) = 
# 35 "pfx/basic/parser.mly"
                         ( _1 :: _2 )
# 94 "pfx/basic/parser.ml"
         in
        _menhir_goto_command_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_command : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.command) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | DIV ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LOAD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | MOD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | MUL ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | POP ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | PRINT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | PUSH _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | REM ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | STORE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | EOF ->
        _menhir_reduce13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.command list) = 
# 34 "pfx/basic/parser.mly"
                ( [] )
# 152 "pfx/basic/parser.ml"
     in
    _menhir_goto_command_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 40 "pfx/basic/parser.mly"
         ( Swap )
# 163 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 44 "pfx/basic/parser.mly"
        ( Sub )
# 174 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 41 "pfx/basic/parser.mly"
          ( Store )
# 185 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 47 "pfx/basic/parser.mly"
        ( Rem )
# 196 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "pfx/basic/parser.mly"
       (int)
# 203 "pfx/basic/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (
# 6 "pfx/basic/parser.mly"
       (int)
# 217 "pfx/basic/parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let _v : (Ast.command) = 
# 39 "pfx/basic/parser.mly"
             ( Push _2 )
# 223 "pfx/basic/parser.ml"
         in
        _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 49 "pfx/basic/parser.mly"
          ( Print )
# 240 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 39 "pfx/basic/parser.mly"
                                ( Pop )
# 251 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 45 "pfx/basic/parser.mly"
        ( Mul )
# 262 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 48 "pfx/basic/parser.mly"
        ( Mod )
# 273 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 42 "pfx/basic/parser.mly"
         ( Load )
# 284 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 46 "pfx/basic/parser.mly"
        ( Div )
# 295 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 43 "pfx/basic/parser.mly"
        ( Add )
# 306 "pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | DIV ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | LOAD ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | MOD ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | MUL ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | POP ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | PRINT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | PUSH _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | REM ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | STORE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | SUB ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | SWAP ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | EOF ->
            _menhir_reduce13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

# 51 "pfx/basic/parser.mly"
  

# 379 "pfx/basic/parser.ml"

# 269 "<standard.mly>"
  

# 384 "pfx/basic/parser.ml"
