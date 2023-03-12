val get_unique_values : ('a * 'b list) list -> 'b list

val get_keys : ('a * 'b) list -> 'a list

val get_value : 'a -> ('a * 'b list) list -> 'b list

val add : 'a -> 'b -> ('a * 'b list) list -> ('a * 'b list) list

val reverse : ('a * 'b list) list -> ('b * 'a list) list

val print_dict : (string * string list) list -> unit

val print_dict_intKey : (int * string list) list -> unit