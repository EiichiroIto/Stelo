code generator
emitBlockEnd: aMorph 
	| selector |
	selector := aMorph selector copyWithout: $:.
	selector := (selector, 'End:') asSymbol.
	codeGenerator perform: selector with: aMorph.
	codeGenerator generateLineFeed.