sig Node {
	adj : set Node
}
pred undirected {
all n1 : Node | n1.adj = adj.n1
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
