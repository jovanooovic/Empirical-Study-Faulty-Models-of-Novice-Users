sig Node {
	adj : set Node
}
pred oriented {
all x, y : Node | (x in ^adj.y) and (y in ^adj.x)
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
