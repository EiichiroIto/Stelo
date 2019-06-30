tests-private
testPrivVarNames
	| v |
	v := SVarId new.
	self assert: v privVarNames class equals: OrderedCollection.
	v privVarNames: 123.
	self assert: v privVarNames equals: 123.