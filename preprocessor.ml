module type PREPROCESSOR = sig
    val inference_graph : ('a * 'b list) list -> ('a * 'a) list
end

module Preprocessor : PREPROCESSOR = 
struct
    let rec intersection_list l1 = function
        | [] -> false
        | hd :: tl -> 
            if (List.mem hd l1) then true
            else intersection_list l1 tl;;
    
    let rec intersection1 (c, s) t acc1 = 
        match t with
          [] -> acc1
        | (c1, s1)::tl -> if(intersection_list s s1) then intersection1 (c, s) tl ((c, c1)::acc1) else intersection1 (c, s) tl acc1 
    
    let inference_graph dict =
        
        let rec make_graph l acc = 
            match l with
                [] -> acc
            | (c, s) :: t -> make_graph t (intersection1 (c, s) t acc)
    
        in make_graph dict []
end
