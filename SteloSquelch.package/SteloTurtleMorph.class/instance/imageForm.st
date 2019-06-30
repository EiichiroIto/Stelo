accessing
imageForm
	| f c |
	f := Form extent: 10 @ 10 depth: 32.
	c := SColorList colorAt: self target defaultColor.
	f fill: f boundingBox rule: Form over fillColor: c.
	^ f