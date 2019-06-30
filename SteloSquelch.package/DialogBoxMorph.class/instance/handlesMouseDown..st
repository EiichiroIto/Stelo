event handling
handlesMouseDown: evt
	^ (evt cursorPoint y between: self top and: self top + 32) not