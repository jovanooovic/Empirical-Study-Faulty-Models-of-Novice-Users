sig Node {
	adj : set Node
}
pred undirected {
for n : Node | for a : n.adj | n in a.adj

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
