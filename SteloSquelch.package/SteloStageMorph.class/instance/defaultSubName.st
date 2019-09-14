private
defaultSubName
	"Answer a default event name for message send and receive blocks."

	| names |
	names := self allSubNames.
	^ names isEmpty
		ifTrue: [ '' ]
		ifFalse: [ names first ]