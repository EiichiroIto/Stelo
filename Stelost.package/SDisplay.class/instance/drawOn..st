drawing
drawOn: aCanvas
	super drawOn: aCanvas.
	microworld ifNil: [ ^ self ].
	self modelChanged
		ifTrue: [ self updateCache ].
	self extent < modelExtent
		ifTrue: [ ^ self ].
	self drawWorldOn: aCanvas.