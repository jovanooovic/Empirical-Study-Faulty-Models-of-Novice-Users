sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv6 {
	some e:Event| some s:State | e in s->trans->State
}


pred inv6C {
    all e:Event | some s1,s2:State | s1->e->s2 in trans 
}
pred overconstrained { inv6C and !inv6}
pred underconstrained { !inv6C and inv6}
pred both { inv6C and inv6 }

run overconstrained
run underconstrained
run both
