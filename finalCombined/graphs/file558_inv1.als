sig Node {
	adj : set Node
}
pred undirected {
all Node a,b | a->b in adj implies b->a in adj
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
