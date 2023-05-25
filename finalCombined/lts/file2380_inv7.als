sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv7 {
	all s: State | s in s.^{x, y: State | some (x.trans).y}



}
pred inv7C {
let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |
	all s : Init.^tr | some i : Init | i in s.^tr
}
pred overconstrained { inv7C and !inv7}
pred underconstrained { !inv7C and inv7}
pred both { inv7C and inv7 }

run overconstrained
run underconstrained
run both
