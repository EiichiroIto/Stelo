tests
testDoOneCycle
	| w p ret |
	w := SMicroWorld new.
	w createPatchOrder: 1.
	w create: 3 turtles: 1.
	p := SProcess microworld: w program: self sampleProgram3.
	p privRunningEvents: {4}.
	ret := p doOneCycle.
	self assert: ret not.