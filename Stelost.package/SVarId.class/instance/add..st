accessing
add: aString
	(self includes: aString)
		ifTrue: [ ^ self varNoFor: aString ].
	varNames add: aString.
	^ self newNo