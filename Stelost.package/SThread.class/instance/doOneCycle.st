execution
doOneCycle
	| code |
	[ pc > codes size
		ifTrue: [ ^ false ].
	code := codes at: pc.
	code = #yield
		ifTrue: [ ^ true ].
	pc := pc + 1.
	code isSymbol
		ifTrue: [ self perform: code ]
		ifFalse: [ self push: code ] ] repeat.