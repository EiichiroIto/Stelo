event handling
mouseDown: evt
	| pos |
	pos := evt cursorPoint - self topLeft.
	self send: #clickedAt: at: pos.