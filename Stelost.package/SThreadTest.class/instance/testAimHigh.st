tests-turtle ops
testAimHigh
	| w v t |
	w := SMicroWorld new.
	w createPatchOrder: 5.
	w create: 3 turtles: 1.
	v := w patches addVariable: 'a'.
	"
	21 22 23 24 25
	16 17 18 19 20
	11 12 13 14 15
	 6  7  8  9 10
	 1  2  3  4  5
"
	w x: 3 at: 1 put: 0.
	w y: 3 at: 1 put: 0.
	w
		var: STurtleVarId headingVarNo
		breedNo: 3
		at: 1
		put: 45.
	w
		var: v
		breedNo: 2
		at: 18
		put: 1.
	w
		var: v
		breedNo: 2
		at: 19
		put: 2.
	w
		var: v
		breedNo: 2
		at: 14
		put: 3.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t push: v.
	t aimHigh.
	self assert: t pop equals: -45