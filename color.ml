let basic_coloring courses = 
    let rec loop acc c =
        match c with 
        |   [] -> []
        |   hd :: tl -> (hd, acc) :: (loop (acc + 1) tl)
    in loop 0 courses

let get_unique_colors l =
    let rec unique acc = function
        |   [] -> acc
        |   (k, c) :: tl ->
                if((List.mem c acc) = false) then unique (c :: acc) tl
                else unique acc tl
    in unique [] l