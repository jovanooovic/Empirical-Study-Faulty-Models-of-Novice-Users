sig Node {
	adj : set Node
}
pred transitive {
all e1, e2, e3 : Node | (e1 -> e2 in adj and e2 -> e3 in adj) implies e1 -> e2 in adj
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
