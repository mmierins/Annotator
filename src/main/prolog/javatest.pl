piemeers([]).
piemeers('.'('.'(','('.'(x, '.'(x, '.'('.'(n, '.'(_0, '.'(_1, '.'(_2, '.'(n, '.'(_3, [])))))), '.'(_4, '.'(_5, '.'(defs, '.'(apvienojums, []))))))), apvienojums), '.'('.'(','('.'(x, '.'(x, '.'('.'(n, '.'(c, '.'(m, '.'(s, '.'(n, '.'(2, [])))))), '.'(cirvis, '.'(_6, '.'(tool, '.'(null, []))))))), cirvis), []), '.'('.'(','('.'(x, '.'(x, '.'('.'(c, '.'(c, '.'(s, []))), '.'(un, '.'(_7, '.'(tool, '.'(null, []))))))), un), []), '.'('.'('.'(','('.'('.'(apz?m?t?js, '.'(nr2, [])), '.'(_8, '.'('.'(a, '.'(f, '.'(m, '.'(s, '.'(n, '.'(n, '.'(p, []))))))), '.'(liels, '.'(_9, '.'(tool, '.'(null, []))))))), liels), []), '.'(','('.'(x, '.'(x, '.'('.'(n, '.'(c, '.'(m, '.'(s, '.'(n, '.'(1, [])))))), '.'(?murs, '.'(_10, '.'(tool, '.'(null, []))))))), ?murs), [])), [])))), []) 
).

                                                                                                
parse_results_java([],[]).

parse_results_java([Result | Results], [JavaResult | JavaResults]) :-
	parse_results_java( Results, JavaResults ),
	parse_chunks_java(Result, JavaResult).	

parse_chunks_java([],[]).

parse_chunks_java( [Chunk | Chunks], [JavaResult | JavaResults]) :-
	parse_chunks_java( Chunks, JavaResults),
	parse_chunk_java( Chunk, JavaResult).
	                     

parse_chunk_java( Word , Word ) :-
	is_word(Word).

parse_chunk_java( Word , JavaResult) :-
	is_chunk_word(Word),
	sformat(JavaResult, '~q', Word).

parse_chunk_java( [WordOrChunk | [] ], JavaResult) :-
	parse_chunk_java( WordOrChunk, JavaResult).

parse_chunk_java( [WordOrChunk | Chunk ], [JavaResult | JavaResults]) :-
	parse_chunk_java( WordOrChunk, JavaResult),
	parse_chunk_java( Chunk, JavaResults).
       

add_analyzer_words(SWordFormList) :-
	atom_to_term(SWordFormList, WordFormList, _),
	define_analyzer_afs(WordFormList).
                                        
retracttool :-
	retractall(af(_,_,_,tool,_)).