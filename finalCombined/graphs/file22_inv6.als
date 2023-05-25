sig Node {
	adj : set Node
}
pred weaklyConnected {
all n1, n2, n3: Node | n1->n2 in adj and n3->n2 in adj implies n1->n3 in adj 
}

pred weaklyConnectedC {
	all n:Node | Node in n.*(adj+~adj)
}
pred overconstrained { inv6C and !inv6}
pred underconstrained { !inv6C and inv6}
pred both { inv6C and inv6 }

run overconstrained
run underconstrained
run both
