accessing
allSymbols
	"self allSymbols inspect."
	| list |
	list := SteloStageMorph blockSpecs, SteloPatchMorph blockSpecs, SteloTurtleMorph blockSpecs.
	list := list select: [ :each | each isArray ].
	list := list collect: [ :each | each third ].
	list := list collect: [ :each | self operatorAt: each ifAbsent: [ each ] ].
	list := list asSet.
	list := list asSortedCollection.
	^ list asArray