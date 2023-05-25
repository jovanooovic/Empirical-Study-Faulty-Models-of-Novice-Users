sig Node {
	adj : set Node
}
pred undirected {
all n1,n2:Node | some n1.adj:>n2 implies some n2.adj:>n1
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
