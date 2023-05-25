sig Node {
	adj : set Node
}
pred oriented {
some disj n1, n2: Node | n1 in n2.adj and n2 !in n1.adj
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
