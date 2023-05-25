sig Node {
	adj : set Node
}
pred undirected {
all e1, e2 : Node | e1 -> e2 in adj implies e2 -> e1 in adj
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
