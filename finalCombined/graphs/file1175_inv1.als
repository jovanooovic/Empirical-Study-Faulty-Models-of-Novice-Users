sig Node {
	adj : set Node
}
pred undirected {
all n1:n2:Node | n1->n2 in Node implies n2->n1 in Node
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
