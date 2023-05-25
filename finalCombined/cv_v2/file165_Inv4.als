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
 all w1,w2:Work | w1 in visible.(User.profile) and w2 in visible.(User.profile) implies w1=w2
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
