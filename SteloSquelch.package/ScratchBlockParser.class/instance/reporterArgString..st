arg generator
reporterArgString: aReporterMorph
	| selector |
	selector := aReporterMorph selector copyWithout: $:.
	(self class isOperator: selector)
		ifTrue: [ selector := self class operatorAt: selector ifAbsent: [ self error ] ].
	selector := (selector , ':') asSymbol.
	^ codeGenerator perform: selector with: aReporterMorph.