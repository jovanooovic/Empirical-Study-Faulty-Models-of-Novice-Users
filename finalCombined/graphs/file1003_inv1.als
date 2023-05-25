sig Node {
	adj : set Node
}
pred undirected {
a,b:Node | b in a.adj implies a in b.adj
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
