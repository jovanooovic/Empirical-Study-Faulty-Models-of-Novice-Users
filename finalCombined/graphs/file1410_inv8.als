sig Node {
	adj : set Node
}
pred transitive {
all n1, n2, n3 : Node | ((n1->n2) and (n2->n3)) implies (n1->n3)
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
