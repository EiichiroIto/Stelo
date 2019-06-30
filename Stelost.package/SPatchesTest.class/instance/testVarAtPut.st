tests-accessing variable
testVarAtPut
	| ps |
	ps := SPatches new.
	ps clear.
	ps create: 2.
	ps var: SPatchVarId screenVarNo at: 1 put: 2.
	ps var: SPatchVarId screenVarNo at: 2 put: 5.
	ps var: SPatchVarId colorVarNo at: 1 put: 100.
	ps var: SPatchVarId colorVarNo at: 2 put: 200.
	self assert: (ps var: SPatchVarId screenVarNo at: 1) equals: 2.
	self assert: (ps var: SPatchVarId screenVarNo at: 2) equals: 5.
	self assert: (ps colorAt: 1) equals: 100.
	self assert: (ps colorAt: 2) equals: (SColorList default normalize: 200).