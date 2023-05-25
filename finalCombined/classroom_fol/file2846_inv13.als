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

pred inv13 {

 
 all s:Student, t:Teacher | s not in Person.*Tutors and t not in Person.*Tutors
}


pred inv13C {
  Tutors.Person in Teacher and Person.Tutors in Student 
}
pred overconstrained { inv13C and !inv13}
pred underconstrained { !inv13C and inv13}
pred both { inv13C and inv13 }

run overconstrained
run underconstrained
run both
