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

pred inv11 {
 
all c : Class, t : Teacher | no (t.Teaches).c => no c.Groups
}



pred overconstrained { inv11C and !inv11}
pred underconstrained { !inv11C and inv11}
pred both { inv11C and inv11 }

run overconstrained
run underconstrained
run both
