sig Node {
	adj : set Node
}
pred transitive {
all x, y, z : Node | x->y in adj and y->z in adj implies x->z in adj
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
