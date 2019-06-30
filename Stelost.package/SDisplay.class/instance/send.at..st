private
send: aSymbol at: aPoint
	| pos ps |
	pos := self positionOf: aPoint.
	ps := microworld patches.
	pos := pos x @ (ps cols - pos y + 1).
	(pos x between: 1 and: ps rows) ifFalse: [ ^ self ].
	(pos y between: 1 and: ps cols) ifFalse: [ ^ self ].
	pos := ps pointOfRow: pos x col: pos y.
	(owner notNil and: [ owner respondsTo: aSymbol ])
		ifTrue: [ owner perform: aSymbol with: pos ].