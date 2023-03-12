(* converts colored graph to timetable *)
let get_timetable t = 
    let rec loop acc = function
        |   [] -> acc
        |   (k, c) :: tl -> loop(Dict.add c k acc) tl
    in loop [] t;;


let t1 () = 
    let registration_data = [
        ("S1", ["C1"; "C2"]);
        ("S2", ["C1"; "C3"]);
        ("S3", ["C1"]);
        ("S4", ["C2"; "C3"]);
        ("S5", ["C2"]);
        ("S6", ["C1"; "C2"; "C3"]);
        ("S7", ["C3"]);
        ("S8", ["C1"])
      ] in
    let courses_dict = Dict.reverse(registration_data) in 
    let () = Dict.print_dict(courses_dict) in 
    let inference_graph = Preprocessor.Preprocessor.inference_graph(courses_dict) in
    let basic_color = Color.basic_coloring(Dict.get_keys courses_dict) in 
    let timetable = get_timetable(basic_color) in
    Dict.print_dict_intKey(timetable);;

t1();;