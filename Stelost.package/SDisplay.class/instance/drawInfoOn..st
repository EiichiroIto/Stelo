drawing
drawInfoOn: aCanvas
	info ifNil: [ ^ self ].
	aCanvas drawString: info at: self topLeft + (5 @ 5) font: nil color: Color white.