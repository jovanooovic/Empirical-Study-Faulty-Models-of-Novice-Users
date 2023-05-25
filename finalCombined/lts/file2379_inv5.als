sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv5 {
  all disj s1, s2: State | all e1, e2: Event |some n: State| e1->n in s1.trans and e2->n in s2.trans implies e1=e2
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
