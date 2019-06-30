private
symbols
	| list |
	list := self selectors asOrderedCollection.
	list removeAll: self executionSelectors.
	^ list sort