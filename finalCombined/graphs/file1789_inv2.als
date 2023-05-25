sig Node {
	adj : set Node
}
pred oriented {
all n1,n2:Node | some n1.adj:>n2 implies no n2.adj:>n1
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
