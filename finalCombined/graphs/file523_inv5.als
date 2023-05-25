sig Node {
	adj : set Node
}
pred noLoops {
all a:Node | not (a.adj=a) 
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
