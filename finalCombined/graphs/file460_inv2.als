sig Node {
	adj : set Node
}
pred oriented {
all n, n1 : Node | n->n1 in adj => n1->n not in adj

adj & ~adj in id
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
