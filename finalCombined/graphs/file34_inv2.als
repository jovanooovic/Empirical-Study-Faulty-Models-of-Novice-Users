sig Node {
	adj : set Node
}
pred oriented {
all n : Node | some adj.n
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
