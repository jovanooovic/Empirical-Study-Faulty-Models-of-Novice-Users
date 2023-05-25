sig Node {
	adj : set Node
}
pred transitive {
all v1,v2,v3:Node | v1->v2 in adj and v2->v3 in adj implies v1->v3
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
