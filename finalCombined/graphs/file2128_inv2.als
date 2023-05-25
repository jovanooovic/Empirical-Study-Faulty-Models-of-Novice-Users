sig Node {
	adj : set Node
}
pred oriented {
all v1, v2 : Node | v1->v2 in adj implies not v2->v1 in adj
 no adj & ~adj
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
