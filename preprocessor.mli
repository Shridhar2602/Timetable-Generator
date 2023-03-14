module type PREPROCESSOR =
	(* make inference graph from dictionary  *)
	sig 
		val inference_graph : ('a * 'b list) list -> ('a * 'a) list 
		val adjacency_list : ('a * 'a) list -> ('a * 'a list) list
	end

module Preprocessor : PREPROCESSOR