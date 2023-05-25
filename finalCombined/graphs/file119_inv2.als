sig Node {
	adj : set Node
}
pred oriented {
all n1:Node | some n2:Node | n2 in n1.adj implies n1 not in n2.adj 
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
