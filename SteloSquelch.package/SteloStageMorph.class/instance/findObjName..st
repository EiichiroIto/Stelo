accessing
findObjName: aString
	self objName = aString
		ifTrue: [ ^ self ].
	^ self sprites
		detect: [ :each | each objName = aString ]
		ifNone: [ nil ]