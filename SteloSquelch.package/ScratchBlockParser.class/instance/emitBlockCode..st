code generator
emitBlockCode: aMorph 
	| selector |
	selector := aMorph selector copyWithout: $:.
	selector := (selector, ':') asSymbol.
	codeGenerator perform: selector with: aMorph.
	codeGenerator generateLineFeed.