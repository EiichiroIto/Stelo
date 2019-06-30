accessing
var: anInteger at: id
	| v |
	v := vars at: anInteger asInteger.
	id = 0
		ifTrue: [ ^ 0 ].
	id > v size
		ifTrue: [ self error ].
	^ v at: id.