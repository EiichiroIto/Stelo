stelo
colorMenu
	^ SColorList colorNames collect: [ :each | Array with: each with: (SColorList perform: each) ].