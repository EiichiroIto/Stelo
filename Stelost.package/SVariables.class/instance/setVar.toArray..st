accessing
setVar: anInteger toArray: aCollection
	| v |
	v := vars at: anInteger.
	v class ~= aCollection class ifTrue: [ ^ self error ].
	vars at: anInteger put: aCollection.