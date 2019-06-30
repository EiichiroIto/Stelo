tests-misc ops
testDirectionToXY
	| w t b r |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	w x: 3 at: 2 put: 1.
	b := SBytecodeGenerator new.
	r := b directionToX: 2 y: 1.
	self assert: r isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	r := t evaluate: b code.
	self assert: r closeTo: 0.5 arcTan radiansToDegrees.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	r := t evaluate: b code.
	self assert: r closeTo: 45