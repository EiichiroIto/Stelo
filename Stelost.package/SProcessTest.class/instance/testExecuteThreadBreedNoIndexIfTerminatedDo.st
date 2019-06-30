tests-execution
testExecuteThreadBreedNoIndexIfTerminatedDo
	| w p c f x |
	w := SMicroWorld new.
	p := SProcess microworld: w program: SProgram new.
	w create: 3 turtles: 1.
	w var: SVarId colorVarNo breedNo: 3 at: 1 put: SColorList black.
	c := {SColorList white. #setColorTo}.
	f := false.
	p executeThread: c breedNo: 3 index: 1 ifTerminatedDo: [ f := true ].
	x := w var: SVarId colorVarNo breedNo: 3 at: 1.
	self assert: x equals: SColorList white.
	self deny: f.
	c := {#stopAll}.
	p executeThread: c breedNo: 3 index: 1 ifTerminatedDo: [ f := true ].
	self assert: f.