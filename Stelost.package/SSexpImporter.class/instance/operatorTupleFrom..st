private
operatorTupleFrom: aCollection
	| selector tuple |
	selector := SteloBlockParser
				invOperatorAt: aCollection first asSymbol
				ifAbsent: [ self error ].
	tuple := aCollection copy.
	tuple at: 1 put: selector.
	self updateArgs: tuple.
	^ tuple