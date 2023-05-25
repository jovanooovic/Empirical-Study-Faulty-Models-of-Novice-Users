sig Node {
	adj : set Node
}
pred transitive {
all n, n2 : Node | some n1 : Node | n->n1 in adj and n1->n2 in adj => n->n2 in adj
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
