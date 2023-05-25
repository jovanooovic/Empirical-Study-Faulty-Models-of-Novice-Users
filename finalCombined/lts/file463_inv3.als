sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv3 {
	all s : State, disj e, e1 : Event | s->e in trans.State and s->e1 in trans.State => e = e1
}


pred inv3C {
	all s : State, e : Event | lone e.(s.trans)
}
pred overconstrained { inv3C and !inv3}
pred underconstrained { !inv3C and inv3}
pred both { inv3C and inv3 }

run overconstrained
run underconstrained
run both
