sig Node {
	adj : set Node
}
pred oriented {
all e1, e2 : Node | e1 -> e2 in adj implies e2 -> e1 not in adj

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
