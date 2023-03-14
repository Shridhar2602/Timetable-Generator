module type PREPROCESSOR = sig
    val inference_graph : ('a * 'b list) list -> ('a * 'a) list
    val adjacency_list : ('a * 'a) list -> ('a * 'a list) list
end

module Preprocessor : PREPROCESSOR = 
struct
    (* if two lists intersects or not *)
    let rec intersection_list l1 = function
        | [] -> false
        | hd :: tl -> 
            if (List.mem hd l1) then true
            else intersection_list l1 tl;;
    
    (* helper function to calculate intersection of value of a key with the rest of the dictionary *)
    let rec intersection1 (c, s) t acc1 = 
        match t with
        | [] -> acc1
        | (c1, s1)::tl -> if(intersection_list s s1) then intersection1 (c, s) tl ((c, c1)::acc1) else intersection1 (c, s) tl acc1 
    
    (* create inference graph *)
    let inference_graph dict =
        let rec make_graph l acc = 
            match l with
                | [] -> acc
                | (c, s) :: t -> make_graph t (intersection1 (c, s) t acc)

        in make_graph dict []

    (* create adjacency list from inference graph *)
    let adjacency_list graph = 
        let rec loop acc = function
            | [] -> acc
            | (n1, n2) :: tl -> loop(Dict.add n1 n2 (Dict.add n2 n1 acc)) tl 

        in loop [] graph;;
end
