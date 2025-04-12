
module MenhirBasics = struct
  
  exception Error
  
  let _eRR : exn =
    Error
  
  type token = 
    | SWAP
    | SUB
    | STORE
    | REM
    | PUSH
    | PRINT
    | POP
    | MUL
    | MOD
    | LOAD
    | INT of (
# 6 "project/pfx/basic/parser.mly"
       (int)
# 24 "project/pfx/basic/parser.ml"
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

# 1 "project/pfx/basic/parser.mly"
  
  open Ast

# 49 "project/pfx/basic/parser.ml"

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
# 6 "project/pfx/basic/parser.mly"
       (int)
# 66 "project/pfx/basic/parser.ml"
            ))), _, (_2 : (Ast.command list))) = _menhir_stack in
            let _v : (Ast.program) = 
# 30 "project/pfx/basic/parser.mly"
                         ( _1, _2 )
# 71 "project/pfx/basic/parser.ml"
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
# 35 "project/pfx/basic/parser.mly"
                         ( _1 :: _2 )
# 90 "project/pfx/basic/parser.ml"
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
    | PUSH ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
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
# 34 "project/pfx/basic/parser.mly"
                ( [] )
# 148 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 40 "project/pfx/basic/parser.mly"
         ( Swap )
# 159 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 44 "project/pfx/basic/parser.mly"
        ( Sub )
# 170 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 41 "project/pfx/basic/parser.mly"
          ( Store )
# 181 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 47 "project/pfx/basic/parser.mly"
        ( Rem )
# 192 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (
# 6 "project/pfx/basic/parser.mly"
       (int)
# 209 "project/pfx/basic/parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : (Ast.command) = 
# 38 "project/pfx/basic/parser.mly"
             ( Push _2 )
# 215 "project/pfx/basic/parser.ml"
         in
        _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 49 "project/pfx/basic/parser.mly"
          ( Print )
# 232 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 39 "project/pfx/basic/parser.mly"
        ( Pop )
# 243 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 45 "project/pfx/basic/parser.mly"
        ( Mul )
# 254 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 48 "project/pfx/basic/parser.mly"
        ( Mod )
# 265 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 42 "project/pfx/basic/parser.mly"
         ( Load )
# 276 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 46 "project/pfx/basic/parser.mly"
        ( Div )
# 287 "project/pfx/basic/parser.ml"
     in
    _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.command) = 
# 43 "project/pfx/basic/parser.mly"
        ( Add )
# 298 "project/pfx/basic/parser.ml"
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
        | PUSH ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1
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

# 51 "project/pfx/basic/parser.mly"
  

# 371 "project/pfx/basic/parser.ml"

# 269 "<standard.mly>"
  

# 376 "project/pfx/basic/parser.ml"
