private
tupleFrom: aCollection
	| selector tuple |
	selector := aCollection first asSymbol.
	(SteloBlockParser isInvOperator: selector)
		ifTrue: [ ^ self operatorTupleFrom: aCollection ].
	selector = #getVar
		ifTrue: [ ^ self getVarTupleFrom: aCollection ].
	(#(setVar:to: changeVar:by:) includes: selector)
		ifTrue: [ ^ self setVarTupleFrom: aCollection ].
	selector = #doIfElse
		ifTrue: [ ^ self ifElseTupleFrom: aCollection ].
	(#(doIf doRepeat) includes: selector)
		ifTrue: [ ^ self cBlockTupleFrom: aCollection ].
	tuple := aCollection copy.
	self updateArgs: tuple.
	^ tuple