accessing
evaluate: aCollection
	self codes: aCollection.
	[ self doOneCycle ] whileTrue.
	^ self pop