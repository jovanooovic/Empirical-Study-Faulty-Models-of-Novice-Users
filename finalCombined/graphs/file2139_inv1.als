sig Node {
	adj : set Node
}
pred undirected {
all n1,n2:Node | adj(n1,n2) implies adj(n2,n1)
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
