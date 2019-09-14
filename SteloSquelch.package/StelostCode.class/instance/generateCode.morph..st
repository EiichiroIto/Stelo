code generator
generateCode: aSymbol morph: aMorph
	self class addCommand: aSymbol.
	self
		try: [ self perform: aSymbol withArguments: aMorph blockArgs ]
		onFailure: [ aMorph showBalloon: 'error' ]