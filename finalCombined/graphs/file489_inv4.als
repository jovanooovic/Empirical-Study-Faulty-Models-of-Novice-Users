sig Node {
	adj : set Node
}
pred complete {
all n1,n2 :Node | n1->n2 in adj
}

pred completeC {
	all n:Node | Node in n.adj
}
pred overconstrained { inv4C and !inv4}
pred underconstrained { !inv4C and inv4}
pred both { inv4C and inv4 } 

run overconstrained
run underconstrained
run both
