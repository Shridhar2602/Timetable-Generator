module type COLORGRAPH = sig
    val basic_coloring : 'a list -> ('a * int) list
    val chaitin : ('a * 'a list) list -> ('a * 'b list) list -> 'b list -> ('a * 'b list) list
end

module ColorGraph : COLORGRAPH =
struct

    (* creates and populated a chaitin stack from adjacency graph *)
    let create_chaitin_stack adj_list = 
        let stack = Stack.create() in 
        let sorted_adj_list = Dict.sort_dict_values adj_list in
        let rec create_stack = function
            | [] -> stack
            | (n, l) :: tl -> begin 
                Stack.push n stack;
                create_stack (Dict.remove_value n tl)
            end 
        in create_stack sorted_adj_list

    (* Apply Chaitin algorithm for k-coloring *)
    let chaitin adj_list dict colors = 
        let stack = create_chaitin_stack adj_list in

        let rec chaitin adj_list dict colors = 
            if(Stack.is_empty stack = false) then
                let node = Stack.pop stack in
                let edges = Dict.get_value node adj_list in
        
                let valid_colors = let rec loop c = function 
                    | [] -> c 
                    | hd :: tl -> 
                        if(List.length (Dict.get_value hd dict) = 0) then
                            loop c tl
                        else
                            loop (List.filter (fun x -> x <> (List.hd (Dict.get_value hd dict))) c) tl
                in loop colors edges in
        
                chaitin adj_list (Dict.add node (List.hd valid_colors) dict) colors 
        
            else 
                dict
        in chaitin adj_list dict colors

    (* Basic coloring - Assign unqiue color to all nodes *)
    let basic_coloring courses = 
        let rec loop acc c =
            match c with 
            |   [] -> []
            |   hd :: tl -> (hd, acc) :: (loop (acc + 1) tl)
        in loop 0 courses
                
end