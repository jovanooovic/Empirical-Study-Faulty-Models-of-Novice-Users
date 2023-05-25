sig Node {
	adj : set Node
}
pred oriented {
all n1,n2:Node | n1->n2 in adj implies n2->n1 not in adj
}

pred orientedC {
	no adj & ~adj 
}
pred overconstrained { inv2C and !inv2}
pred underconstrained { !inv2C and inv2}
pred both { inv2C and inv2 }

run overconstrained
run underconstrained
run both
