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
all p : Person | some q,r : Person | (p->q in Tutors or q->p in Tutors or p->r in Tutors or r->p in Tutors)
 implies (p in Teacher or q in Teacher or r in Teacher)
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
