sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv5 {
	all s1, s2:State, e:Event | s1->e->s2 in trans and s1->e->s1 in trans
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
