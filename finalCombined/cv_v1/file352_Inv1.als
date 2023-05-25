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
pred Inv1 { // The works publicly visible in a curriculum must be part of its profile
all w1, w2 : Work | w1->w2 in visible w1->w2 and in profile
}


pred Inv1C {
	all u:User | u.visible in u.profile
}
pred overconstrained { Inv1C and !Inv1}
pred underconstrained { !Inv1C and Inv1}
pred both { Inv1C and Inv1 }

run overconstrained
run underconstrained
run both