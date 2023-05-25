sig Node {
	adj : set Node
}
pred stonglyConnected {


all disj x,y : Node | x in y.^adj
pred stonglyConnectedC {
	all n:Node | Node in n.*adj
}
pred overconstrained { inv7C and !inv7}
pred underconstrained { !inv7C and inv7}
pred both { inv7C and inv7 }

run overconstrained
run underconstrained
run both
