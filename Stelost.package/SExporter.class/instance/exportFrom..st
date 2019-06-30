accessing
exportFrom: aStageMorph
	| frame |
	frame := aStageMorph frameMorph.
	events := aStageMorph setupEvents.
	title := frame ifNil: [ '' ] ifNotNil: [ frame projectName ].
	stream := WriteStream on: ''.
	self writeHeader.
	self writeSprites: { aStageMorph }, aStageMorph sprites.
	self writeFooter.
	^ stream contents