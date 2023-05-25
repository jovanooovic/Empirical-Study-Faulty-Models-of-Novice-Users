sig Node {
	adj : set Node
}
pred transitive {
all n : Node | let n1 = n.adj.adj.Node | n->n1 in adj

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
