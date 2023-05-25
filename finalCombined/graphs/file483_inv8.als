sig Node {
	adj : set Node
}
pred transitive {
all a,b,c:Node | a->b in adj and b->c in adj implies a->c in adj
}

pred transitiveC {
	adj.adj in adj
}
pred overconstrained { inv8C and !inv8}
pred underconstrained { !inv8C and inv8}
pred both { inv8C and inv8 }

run overconstrained
run underconstrained
run both
