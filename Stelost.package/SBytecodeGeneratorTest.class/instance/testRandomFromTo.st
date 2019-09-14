tests-arithmetic ops
testRandomFromTo
	| t b r |
	b := SBytecodeGenerator new.
	10
		timesRepeat: [ r := b randomFrom: 1 to: 10.
			self assert: r isNil.
			t := SThread sworld: SMicroWorld new.
			t codes: b code.
			self assert: ((t evaluate: 1) between: 1 and: 10) ].