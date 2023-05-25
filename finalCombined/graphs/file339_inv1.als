sig Node {
	adj : set Node
}
pred undirected {
all n : Node, a : n.adj | n->a => a->n 
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
