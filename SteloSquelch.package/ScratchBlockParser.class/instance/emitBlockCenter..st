code generator
emitBlockCenter: aMorph 
	| selector |
	selector := aMorph selector copyWithout: $:.
	selector := (selector, 'Center:') asSymbol.
	codeGenerator perform: selector with: aMorph.
	codeGenerator generateLineFeed.