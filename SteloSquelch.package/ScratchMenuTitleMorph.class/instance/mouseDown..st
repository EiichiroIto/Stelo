event handling
mouseDown: evt
	target isNil | selector isNil
		ifTrue: [ ^ self ].
	Cursor normal show.
	target perform: selector with: self.