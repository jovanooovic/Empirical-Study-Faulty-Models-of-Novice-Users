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

pred inv15 {
all p1,p2,p3:Person | (p1 in Teacher implies (p2 and p3 in Student) )or (p2 in Teacher implies (p1 and p3 in Student) ) or (p3 in Teacher implies (p2 and p1 in Student) )
}




pred inv15C {
  all s : Person | some Teacher & ^Tutors.s
}
pred overconstrained { inv15C and !inv15}
pred underconstrained { !inv15C and inv15}
pred both { inv15C and inv15 }

run overconstrained
run underconstrained
run both
