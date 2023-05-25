sig Node {
	adj : set Node
}
pred undirected {
all disj n, n1 : Node | n->n1 in adj => n1->n in adj
 all n : Node, n1 : n.adj | n in n1.adj
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
