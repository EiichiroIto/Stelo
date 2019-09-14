event handling
mouseDown: evt
	(logoMorph bounds containsPoint: evt cursorPoint)
		ifFalse: [ ^ self ].
	fillScreenFlag
		ifTrue: [ ^ self ].
	evt yellowButtonPressed
		ifTrue: [ ^ evt hand grabMorph: self ].
	self comeToFront.