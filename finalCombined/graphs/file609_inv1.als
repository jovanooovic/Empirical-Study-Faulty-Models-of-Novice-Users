sig Node {
	adj : set Node
}
pred undirected {
all v1, v2 : Node | v1->v2 in adj and v2->v1 in adj implies v1 = v2
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
