sig Person  {
	/* Each person tutors a set of persons. */
	Tutors : set Person,
	/* Each person teaches a set of classes. */
	Teaches : set Class
}

/* The registered groups. */
sig Group {}

/* The registered classes. */
sig Class  {
	/* Each class has a set of persons assigned to a group. */
	Groups : Person -> Group
}

/* Some persons are teachers. */
sig Teacher in Person  {}

/* Some persons are students. */
sig Student in Person  {}

pred inv14 { 
 all p1, p2 : Person, c : Class | some c.(p2.Groups ) and c in p1.Teaches implies p2 in p1.Tutors
}




pred overconstrained { inv14C and !inv14}
pred underconstrained { !inv14C and inv14}
pred both { inv14C and inv14 }

run overconstrained
run underconstrained
run both
