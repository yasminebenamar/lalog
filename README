AUTHORS
-------

- CHAHBOUNE NAWAL
- BENAMMAR YASMINE

===============

Description of the project
--------------------------

This project implements a working Expr compiler and a Pfx virtual machine in OCaml.
 The work progresses incrementally, with questions guiding the development of both the compiler and virtual machine.

===============

Sources
-------

Git repository: https://github.com/yasminebenamar/lalog
A PDF containing answers to the non-code-related questions.

===============

How to…
-------

…retrieve the sources?

  git clone https://github.com/yasminebenamar/lalog.git
…compile?

  dune build
  in the project root, run dune build to compile the project.
  dune build expr/main.exe to compile the expr compiler.
  dune build pfx/pfxVM.exe to compile the pfx VM.

…execute and test?

  dune utop and then use the libraries  
  (from project root) dune exec expr/main.exe -- expr/basic/tests/an_example.expr  
  dune exec ./pfxVM.exe -- TESTFILE.pfx -a 12 -a 52

===============

Structure of the project
------------------------

The project is organized as follows:

project  
├── README  
├── dune-project  
├── expr: the expr compiler  
│   ├── README  
│   ├── basic  
│   │   ├── ast.ml  
│   │   ├── ast.mli  
│   │   ├── dune  
│   │   ├── eval.ml  
│   │   ├── eval.mli  
│   │   ├── lexer.mll  
│   │   ├── parser.mly  
│   │   ├── tests: for tests  
│   │   │   └── an_example.expr  
│   │   ├── toPfx.ml             
│   │   └── toPfx.mli  
│   ├── common  
│   │   ├── binOp.ml  
│   │   ├── binOp.mli  
│   │   └── dune  
│   ├── compiler.ml: main file for the expr compiler  
│   ├── dune  
│   ├── fun: the expr parser for section 7  
│   │   ├── ast.ml  
│   │   ├── ast.mli  
│   │   ├── lexer.mll  
│   │   ├── parser.mly
│   |   ├──toPfx.ml
│   │   ├── toPfx.mli
│   └── main.ml 
├── my_tests: for tests
│   ├── count_a_occurrences.ml
│   ├── count_a_occurrences.mll
│   ├── simple_expr_lexer_standalone.ml
│   ├── simple_expr_lexer_standalone.mll
├── pfx: the pfx VM  
│   ├── basic  
│   │   ├── ast.ml  
│   │   ├── ast.mli  
│   │   ├── dune  
│   │   ├── eval.ml  
│   │   ├── eval.mli  
│   │   ├── lexer.mll  
│   │   ├── parser.mly  
│   │   └── tests: for tests  
│   │       └── ok_prog.pfx  
│   └── pfxVM.ml: main file for the pfx VM  
│   ├── dune
└── utils  
    ├── dune  
    ├── location.ml: module offering a data type for a location in a file  
    └── location.mli  

===============

Progress
--------

- All of the exercises up to 8 were done successfully (including compilation and tests).  
- Exercises 9 to 12 were done but without being tested: we couldn't figure out how to run tests for the lambda expressions (e.g., `((λx.λy.(x − y)) 12) 8`).

===============

Known bugs and issues
---------------------

- We were not able to run tests for the lambda expressions (e.g., `((λx.λy.(x − y)) 12) 8`) in exercises 9 to 11.

===============

Helpful resources
-----------------

- Most of the time, we used Stack Overflow to look for solutions to some bugs we encountered.  
- Compilation notes provided on Moodle were really helpful.

===============

Difficulties
------------

- Figuring out how to translate coding instructions to a new programming language we are not used to.  
- Using new tools and new commands to compile the script and make it work.  
- Coding in a new environment and a new paradigm.  
- Testing the code using `utop`, but we figured it out in the end.  
- Testing in section 10.
