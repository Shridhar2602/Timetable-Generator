module type COLORGRAPH = sig
    val basic_coloring : 'a list -> ('a * int) list
    val chaitin : ('a * 'a list) list -> ('a * 'b list) list -> 'b list -> ('a * 'b list) list
end

module ColorGraph : COLORGRAPH