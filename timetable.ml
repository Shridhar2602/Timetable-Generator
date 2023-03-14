(* converts colored graph to timetable *)
(* Redundant now that we are using dicts for coloring in chaitin *)
let get_timetable t = 
    let rec loop acc = function
        |   [] -> acc
        |   (k, c) :: tl -> loop(Dict.add c k acc) tl
    in loop [] t;;

let input1 = [
    ("S1", ["C1"; "C2"]);
    ("S2", ["C1"; "C3"]);
    ("S3", ["C1"]);
    ("S4", ["C2"; "C3"]);
    ("S5", ["C2"]);
    ("S6", ["C1"; "C2"; "C3"]);
    ("S7", ["C3"]);
    ("S8", ["C1"])
]

let input2 = [
    ("S1", ["C1"; "C2"]);
    ("S2", ["C1"; "C3"]);
    ("S3", ["C1"; "C4"]);
    ("S4", ["C1"; "C5"]);
    ("S5", ["C2"; "C3"]);
    ("S6", ["C3"; "C4"]);
    ("S7", ["C4";])
]

let input3 = [
    ("S1", ["C1"; "C2";]);
    ("S2", ["C1"; "C3";]);
    ("S3", ["C1"; "C5";]);
    ("S4", ["C2"; "C3";]);
    ("S5", ["C2"; "C5";]);
    ("S6", ["C3"; "C4";]);
    ("S7", ["C4"; "C5";]);

]

let test registration_data = 
    let () = print_endline("Registration Data - ") in 
    let () = Dict.print_dict(registration_data) in 
    let courses_dict = Dict.reverse(registration_data) in 
    let () = print_endline("\nReversed dict - ") in 
    let () = Dict.print_dict(courses_dict) in 
    let inference_graph = Preprocessor.Preprocessor.inference_graph(courses_dict) in
    let adj_list = Preprocessor.Preprocessor.adjacency_list inference_graph in
    let () = print_endline("\nAdjacency List - ") in 
    let () = Dict.print_dict(adj_list) in
    let empty_dict = Dict.dict_from_list (Dict.get_keys courses_dict) in
    let colors = [1;2;3] in
    let colored_dict = Color.ColorGraph.chaitin adj_list empty_dict colors in
    let () = print_endline("\nTimetable - ") in
    let () = Dict.print_dict_intVal(colored_dict) in 
    let () = print_endline("\n=============================================\n") in ();;

test input1;;
test input2;;
test input3;;