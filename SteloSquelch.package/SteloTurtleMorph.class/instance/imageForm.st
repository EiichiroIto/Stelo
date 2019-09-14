accessing
imageForm
	| f c |
	f := ScratchTheme formAt: #clearTurtlesButtonPressed ifAbsent: [ self error ].
	f := f deepCopy.
	c := SColorList colorAt: breed defaultColor.
	f mapColor: Color white to: c.
	^ f