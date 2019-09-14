test
testSetWordAllBreedFrom
	| w t arr r |
	w := SPluginWorld new.
	t := STurtles new breedNo: 3.
	t create: 50.
	w setupBreed: t.
	arr := #(10 200 30 40 50 60 7 8 9 10) asByteArray.
	w setByteAll: STurtleVarId flagVarNo breed: 3 from: arr.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 1.
	self assert: r equals: 10.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 2.
	self assert: r equals: 200.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 3.
	self assert: r equals: 30.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 4.
	self assert: r equals: 40.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 5.
	self assert: r equals: 50.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 6.
	self assert: r equals: 60.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 7.
	self assert: r equals: 7.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 8.
	self assert: r equals: 8.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 9.
	self assert: r equals: 9.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 10.
	self assert: r equals: 10.