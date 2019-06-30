command
create: anInteger
	| rest pos list |
	rest := anInteger.
	rest <= 0
		ifTrue: [ ^ self ].
	list := OrderedCollection new.
	self
		deadOnesDo: [ :index | 
			self setupTurtleAt: index.
			list add: index.
			rest := rest - 1.
			rest = 0
				ifTrue: [ ^ list ] ].
	pos := variables elementSize.
	variables allocateMore: rest.
	variables elementSize = pos
		ifTrue: [ ^ list ].
	pos := pos + 1.
	pos to: variables elementSize do: [ :each | self aliveAt: each put: false ].
	rest
		timesRepeat: [ self setupTurtleAt: pos.
			list add: pos.
			pos := pos + 1 ].
	^ list