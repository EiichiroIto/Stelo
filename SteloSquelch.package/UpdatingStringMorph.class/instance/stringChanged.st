private
stringChanged
	stringMorph fitContents.
	self width: stringMorph right - self left + 3.
	(owner respondsTo: #fixArgLayout)
		ifTrue: [ owner fixArgLayout ].
	self changed.