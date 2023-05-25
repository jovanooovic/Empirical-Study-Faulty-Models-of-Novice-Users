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
all p1,p2,p3 : Person
 | p1 in Teacher or
 ( p2 in Teacher and p2->p1 in Tutors) or
 ( p3 in Teacher and p3->p2 in Tutors and p2->p1 in Tutors)
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
