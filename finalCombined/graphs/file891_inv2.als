sig Node {
	adj : set Node
}
pred oriented {
all disj n, n1 : Node | n->n1 in adj and n1->n in adj => n1 = n
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
