tests-accessing
testCodeSize
	| c |
	c := SCodeValue data: 0.
	self assert: c codeSize equals: 1.
	c := SCodeValue data: 1.
	self assert: c codeSize equals: 1.
	c := SCodeValue data: 2.
	self assert: c codeSize equals: 3.
	c := SCodeValue data: 32767.
	self assert: c codeSize equals: 3.
	c := SCodeValue data: -32768.
	self assert: c codeSize equals: 3.
	c := SCodeValue data: 32768.
	self assert: c codeSize equals: 5.
	c := SCodeValue data: -32769.
	self assert: c codeSize equals: 5.
	c := SCodeValue data: 1.1.
	self assert: c codeSize equals: 5.