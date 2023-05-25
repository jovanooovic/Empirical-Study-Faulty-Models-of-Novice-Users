sig Node {
	adj : set Node
}
pred undirected {
all disj n1, n2 : n1 in n2.adj implies n2 in n1.adj
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
