  open Str

(* Custom method to print the integers in the required format *)
  let print_special xs final_s = 
    match xs with
    | [] -> Printf.printf "0\n"
    | [x] -> Printf.printf "%d=%d\n" x x
    | x::xs -> 
      List.iter (fun n -> Printf.printf "%d+" n) (List.rev xs);
      Printf.printf "%d=%d\n" x final_s 
  
  

  (*Extracting integers from the lines*)
  let extract_int_lines str = 
    let regexp = Str.regexp "\\([0-9]+\\)" in
    let rec extract start result = 
      try
        ignore (Str.search_forward regexp str start);
        let matched = Str.matched_string str in
        extract (Str.match_end()) (int_of_string matched::result)
      with 
        Not_found -> List.rev result
    in
    extract 0 []

  (*extract integers and sum them and insert them in a list*)
  let process_lines ic = 
    let rec read_and_process sum_list = 
      try
        let line = input_line ic in
        let integers = extract_int_lines line in
        let line_sum = List.fold_left (+) 0 integers in 
        
        print_special integers line_sum;
        read_and_process (line_sum :: sum_list)
      with
        End_of_file -> sum_list
    in read_and_process [] 
  
  (*Open file and process lines *)
  let process_file filename = 
    let ic = open_in filename in
    try
      let result = process_lines ic in
      close_in ic;
      result
    with e ->
      close_in_noerr ic;
      raise e
  
  

  (* main function *)
  let () =
    if Array.length Sys.argv < 2 then
      Printf.printf "Usage: %s <filename>\n" Sys.argv.(0)
    else
      let filename = Sys.argv.(1) in
      let final_sum_list = process_file filename in
      let final_sum = List.fold_left (+) 0 (List.rev final_sum_list) in

      print_special final_sum_list final_sum
    

