sig File {
  	/* A file is potentially a link to other files. */
	link : set File
}
/* The set of files in the trash. */
sig Trash in File {}
/* The set of protected files. */
sig Protected in File {}
pred inv6 {
all f:File | some f1,f2:File | f->f1 in link and f->f2 in link and f1!=f2 implies f1=f2 
}


pred inv6C {
  ~link . link in iden
}
pred overconstrained { inv6C and !inv6}
pred underconstrained { !inv6C and inv6}
pred both { inv6C and inv6 }

run overconstrained
run underconstrained
run both
