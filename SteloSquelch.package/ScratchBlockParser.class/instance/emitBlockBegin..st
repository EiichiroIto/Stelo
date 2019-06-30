code generator
emitBlockBegin: aMorph 
	| selector |
	selector := aMorph selector copyWithout: $:.
	selector := (selector, 'Begin:') asSymbol.
	codeGenerator perform: selector with: aMorph.
	codeGenerator generateLineFeed.