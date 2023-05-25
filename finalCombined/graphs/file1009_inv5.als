sig Node {
	adj : set Node
}
pred noLoops {
all n:Node | n not in n.adj

}
pred noLoopsC {
	no (iden & adj)
}
pred overconstrained { inv5C and !inv5}
pred underconstrained { !inv5C and inv5}
pred both { inv5C and inv5 }

run overconstrained
run underconstrained
run both
