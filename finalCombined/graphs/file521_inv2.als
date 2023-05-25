sig Node {
	adj : set Node
}
pred oriented {
all e1 : Node | no e1.adj & adj.e1 
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