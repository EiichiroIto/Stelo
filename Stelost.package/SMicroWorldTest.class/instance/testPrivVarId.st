tests-private
testPrivVarId
	| w |
	w := SMicroWorld new.
	self assert: w privVarId class equals: SObserverVarId.
	w privVarId: #a.
	self assert: w privVarId equals: #a.