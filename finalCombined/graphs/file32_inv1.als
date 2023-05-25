sig Node {
	adj : set Node
}
pred undirected {
all a,b:Node | a->b in adj implies b->a and a->a not in adj
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
