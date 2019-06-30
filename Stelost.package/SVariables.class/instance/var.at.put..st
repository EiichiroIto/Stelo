accessing
var: anInteger at: id put: anObject
	| v |
	v := vars at: anInteger.
	id = 0
		ifTrue: [ ^ self ].
	id > v size
		ifTrue: [ self error ].
	v at: id put: anObject.