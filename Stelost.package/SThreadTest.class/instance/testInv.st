tests-arithmetic ops
testInv
	| t |
	t := SThread sworld: SMicroWorld new.
	t push: 0.
	t inv.
	self assert: t pop equals: 16rFFFF.
	t := SThread sworld: SMicroWorld new.
	t push: 16rFFFF.
	t inv.
	self assert: t pop equals: 0.
	t := SThread sworld: SMicroWorld new.
	t push: 16r1234.
	t inv.
	self assert: t pop equals: 16rEDCB.