## Ocaml-file-aggregate

Simple CLI tool to aggregate integers extracted from a txt file and show them in a format

Concepts that I learned while doing this:

- OCaML
- Sys.argv.(index) to access system variables
- Error Handling in OCaML


To compile this project, you will need to have OCaML installed.

If its present in your system then you can simply do
```sh
ocamlc -I +str str.cma file.ml
```

To see it in action, you can then do
```sh
./a.out sample.txt
```

used `+str` to get rid of `Unbound module` error for `Str`.