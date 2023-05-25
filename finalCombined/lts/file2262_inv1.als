sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv1 {
	all e : Event | trans.e.trans
}


pred inv1C {
	all s: State | some s.trans
}
pred overconstrained { inv1C and !inv1}
pred underconstrained { !inv1C and inv1}
pred both { inv1C and inv1 }

run overconstrained
run underconstrained
run both
