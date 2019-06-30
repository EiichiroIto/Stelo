event handling
mouseMove: evt
	| pos |
	pos := evt cursorPoint - self topLeft.
	self send: #draggedAt: at: pos.