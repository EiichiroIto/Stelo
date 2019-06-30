tests-arithmetic ops
testRandomFromTo
	| t b r |
	b := SBytecodeGenerator new.
	10
		timesRepeat: [ r := b randomFrom: 1 to: 10.
			self assert: r isNil.
			t := SThread microworld: SMicroWorld new.
			self assert: ((t evaluate: b code) between: 1 and: 10) ].