private
send: aSymbol at: aPoint
	| pos |
	aPoint >= offset
		ifFalse: [ ^ self ].
	aPoint < (offset + (cell * modelExtent))
		ifFalse: [ ^ self ].
	pos := self pointOf: aPoint.
	(owner notNil and: [ owner respondsTo: aSymbol ])
		ifTrue: [ owner perform: aSymbol with: pos ]