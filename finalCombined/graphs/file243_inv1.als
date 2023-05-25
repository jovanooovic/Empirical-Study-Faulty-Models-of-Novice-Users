sig Node {
	adj : set Node
}
pred undirected {
all n1,n2 : Node | n2 in n1.adj implies n1 in n2.adj
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
