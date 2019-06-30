tests-accessing
testHeadingVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'heading') equals: STurtleVarId headingVarNo.