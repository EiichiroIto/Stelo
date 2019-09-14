accessing
bytecode
	^ codes
		collect: [ :each | 
			each isSymbol
				ifTrue: [ SThread indexOfSymbol: each ]
				ifFalse: [ each ] ]