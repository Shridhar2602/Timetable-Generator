(* get list of unique values from dict *)
let rec get_unique_values dict =
    let keys = List.map (fun (_, y) -> y) dict in
    List.fold_left (fun x y -> x @ List.filter (fun i -> List.mem i x = false) y) [] keys;;

(* get list of keys *)
let get_keys d = List.map (fun (x, _) -> x) d

(* get values of key k *)
let get_value k d = 
    match (List.filter (fun (x, y) -> x = k) d) with
    |   [] -> []
    |   (k, v) :: tl -> v

(* takes a key k and a value v and adds it to the dictionary.
    if k doesn't exist, then create a new k-v pair, else append to existing.*)
let rec add k v d =
    match d with
    | [] -> [(k, [v])]
    | (key, values) :: tl ->    
        if k = key then (k, v :: values) :: tl
        else (key, values) :: add k v tl

(* reverses a dictionary  *)
let reverse dict = 
    let rec reverse_dict acc = function
        |   [] -> acc
        |   (s, courses) :: tl -> 
                let acc' = List.fold_left (fun a c -> add c s a) acc courses
            in reverse_dict acc' tl
    in reverse_dict [] dict

(* prints a dictionary -> String.concat concatenates a list of strings *)
let print_dict dict = List.iter (fun (key, values) -> print_string (key ^ ": [" ^ String.concat "; " values ^ "]\n")) dict

(* prints a dictionary with int keys  *)
let print_dict_intKey dict = List.iter (fun (key, values) -> print_string (string_of_int(key) ^ ": [" ^ String.concat "; " values ^ "]\n")) dict