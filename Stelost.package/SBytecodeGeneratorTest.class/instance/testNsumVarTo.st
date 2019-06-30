tests-misc ops
testNsumVarTo
	| w v1 v2 b t |
	w := SMicroWorld new.
	w createPatchOrder: 4.
	v1 := w patches addVariable: 'a'.
	v2 := w patches addVariable: 'b'.
	b := SBytecodeGenerator new.
	b nsumVar: v1 to: v2.
	"
0 1 0 0     4 1 5 4
0 0 1 0 --> 3 4 3 1
0 2 0 0     5 1 6 4
0 0 0 3     6 3 6 0
"
	w patches var: v1 at: 2 put: 1.
	w patches var: v1 at: 7 put: 1.
	w patches var: v1 at: 10 put: 2.
	w patches var: v1 at: 16 put: 3.
	t := SThread microworld: w.
	t forObserver.
	t execute: b code.
	self
		assertCollection: (w patches privVariables arrayOfVarNo: v2)
		equals: #(4 1 5 4 3 4 3 1 5 1 6 4 6 3 6 0) asFloatArray