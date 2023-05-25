sig Node {
	adj : set Node
}
pred undirected {
all n : Node | all ad : n.adj | n in ad.adj and ad.adj in n 

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
