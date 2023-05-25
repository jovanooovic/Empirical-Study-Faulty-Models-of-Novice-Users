abstract sig Source {}
sig User extends Source {
    profile : set Work,
    visible : set Work
}
sig Institution extends Source {}

sig Id {}
sig Work {
    ids : some Id,
    source : one Source
}
pred Inv4 { // The profile of a user cannot have two visible versions of the same work
  all u:User, w1,w2:Work, i:Id | (w1 in u.visible and w2 in u.visible) implies no (w1.i & w2.i)
}


pred Inv4C {  
	all u : User | all disj w1, w2 : u.visible | w1 not in w2.^(ids.~ids)   
}
pred overconstrained { Inv4C and !Inv4}
pred underconstrained { !Inv4C and Inv4}
pred both { Inv4c and Inv4 }

run overconstrained
run underconstrained
run both