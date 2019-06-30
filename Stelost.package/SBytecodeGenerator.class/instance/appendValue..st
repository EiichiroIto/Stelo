private
appendValue: anObject
	| v |
	v := anObject isBlock
		ifTrue: [ anObject value ]
		ifFalse: [ anObject ].
	v ifNil: [ ^ self ].
	stream nextPut: (SCodeValue data: v).