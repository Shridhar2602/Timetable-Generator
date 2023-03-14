val get_unique_values : ('a * 'b list) list -> 'b list
val get_keys : ('a * 'b) list -> 'a list  
val get_value : 'a -> ('a * 'b list) list -> 'b list  
val add : 'a -> 'b -> ('a * 'b list) list -> ('a * 'b list) list  
val reverse : ('a * 'b list) list -> ('b * 'a list) list  
val remove_value : 'a -> ('b * 'a list) list -> ('b * 'a list) list  
val remove_key : 'a -> ('a * 'b) list -> ('a * 'b) list  
val remove_node : 'a -> ('a * 'a list) list -> ('a * 'a list) list  
val sort_dict_values : ('a * 'b list) list -> ('a * 'b list) list  
val dict_from_list : 'a list -> ('a * 'b list) list  
val print_dict : (string * string list) list -> unit  
val print_dict_intKey : (int * string list) list -> unit  
val print_dict_intVal : (string * int list) list -> unit