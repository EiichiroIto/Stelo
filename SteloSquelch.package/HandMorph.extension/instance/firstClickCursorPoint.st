*SteloSquelch
firstClickCursorPoint
	mouseClickState ifNil: [ ^ nil ].
	^ mouseClickState cursorPoint