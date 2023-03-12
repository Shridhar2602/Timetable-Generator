module type PREPROCESSOR =
	(* make inference graph from dictionary  *)
	sig 
		val inference_graph : ('a * 'b list) list -> ('a * 'a) list 
	end

module Preprocessor : PREPROCESSOR