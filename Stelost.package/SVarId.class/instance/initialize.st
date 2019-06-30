initialization
initialize
	super initialize.
	varNames := OrderedCollection new.
	nextNo := 1.
	self class reservedVarNames do: [ :each | self add: each ].