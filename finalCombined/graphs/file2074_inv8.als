sig Node {
	adj : set Node
}
pred transitive {
all n1,n2:Node | n2 in (n1.adj).adj implies n2 in n1.adj

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
