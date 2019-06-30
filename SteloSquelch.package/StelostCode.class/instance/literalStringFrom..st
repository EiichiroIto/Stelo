arg generator
literalStringFrom: anObject
	anObject isString
		ifTrue: [ ^ anObject asNumberNoError ].
	anObject isNumber
		ifTrue: [ ^ anObject ].
	self error.