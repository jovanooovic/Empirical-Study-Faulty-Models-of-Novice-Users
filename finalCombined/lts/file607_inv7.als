sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv7 {
	all s1,s2:State, e1,e2:Event  | s1->e1->s2 in trans implies s2->e2->s1 in trans
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
