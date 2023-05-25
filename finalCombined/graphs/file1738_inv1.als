sig Node {
	adj : set Node
}
pred undirected {
all v1, v2 : Node | v1->v2 in adj implies v2->v1 in adj
}

pred undirectedC {
	adj = ~adj
}
pred overconstrained { inv1C and !inv1}
pred underconstrained { !inv1C and inv1}
pred both { inv1C and inv1 }

run overconstrained
run underconstrained
run both
