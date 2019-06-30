accessing
execute: aCollection
	self codes: aCollection.
	[ self doOneCycle ] whileTrue.