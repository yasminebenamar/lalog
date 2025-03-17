rule count value= parse
| 'a' {count (value+1) lexbuf}
| [^'a']* {count value lexbuf}
|eof {value}