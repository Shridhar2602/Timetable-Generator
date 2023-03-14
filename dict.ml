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

(* Removes value from the values of all keys *)
let rec remove_value value = function
    | [] -> []
    | (k, v) :: tl -> 
        (k, (List.filter (fun x -> x <> value) v)) :: (remove_value value tl)

(* Removes the key-value pair *)
let rec remove_key key = function
    | [] -> []
    | (k, v) :: tl -> if(k = key) then tl else (k, v) :: (remove_key key tl)

(* Removes a node - the key-value pair with node as key and all values containing key
   Basically it removes all occurances of node in the dictionary *)
let remove_node node dict = 
    remove_key node (remove_value node dict)

(* Sort a dictionary based on length of value list *)
let sort_dict_values dict = 
    List.sort (fun (k1, v1) (k2, v2) -> compare (List.length v1) (List.length v2)) dict

(* Create empty dictionary from a list of keys *)
let rec dict_from_list = function 
    | [] -> []
    | hd :: tl -> (hd, []) :: (dict_from_list tl);;

(* prints a dictionary -> String.concat concatenates a list of strings *)
let print_dict dict = List.iter (fun (key, values) -> print_string (key ^ ": [" ^ String.concat "; " values ^ "]\n")) dict

(* prints a dictionary with int keys  *)
let print_dict_intKey dict = List.iter (fun (key, values) -> print_string (string_of_int(key) ^ ": [" ^ String.concat "; " values ^ "]\n")) dict

(* prints a dictionary with int values *)
let print_dict_intVal dict = List.iter (fun (key, values) -> print_string (key ^ ": [" ^ String.concat "; " (List.map (fun x -> string_of_int x) values) ^ "]\n")) dict