dict.cmi : dict.mli
	ocamlopt -c dict.mli

dict.cmx : dict.ml
	ocamlopt -c dict.ml

preprocessor.cmi : preprocessor.mli
	ocamlopt -c preprocessor.mli

preprocessor.cmx : preprocessor.ml
	ocamlopt -c preprocessor.ml

color.cmi : color.mli
	ocamlopt -c color.mli

color.cmx : color.ml
	ocamlopt -c color.ml

# timetable.cmi : timetable.mli color.mli dict.mli preprocessor.mli
# 	ocamlopt -c timetable.mli

timetable.cmx : timetable.ml
	ocamlopt -c timetable.ml

all	: dict.cmi dict.cmx preprocessor.cmi preprocessor.cmx color.cmi color.cmx timetable.cmx
	ocamlopt -o timetable dict.cmx preprocessor.cmx color.cmx timetable.cmx

clear :
	rm *.o *.cmi *.cmx