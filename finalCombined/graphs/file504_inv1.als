sig Node {
	adj : set Node
}
pred undirected {
all adj1, adj2 : Node | x->adj1 and x->adj2 implies adj1 = adj2
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
