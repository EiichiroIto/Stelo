view mode
projectComment: aString
	aString isEmpty
		ifTrue: [ projectInfo removeKey: 'comment' ifAbsent: [  ] ]
		ifFalse: [ projectInfo at: 'comment' put: aString asString ].