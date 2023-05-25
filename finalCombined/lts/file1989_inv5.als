sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv5 {
	all x, y, z : State | some e : Event | x->e->y in trans implies y->e->x in trans
}


pred inv5C {
	all s:State, s1:State | s.trans.State = s1.trans.State
}
pred overconstrained { inv5C and !inv5}
pred underconstrained { !inv5C and inv5}
pred both { inv5C and inv5 }

run overconstrained
run underconstrained
run both
