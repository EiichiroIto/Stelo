accessing
varNoFor: aString
	(self includes: aString)
		ifFalse: [ ^ NotFound signalFor: self ].
	^ varNames indexOf: aString