arg generator
variableArgString: aString
	| v |
	v := targetMorph varId varNoFor: aString.
	^ bcGenerator getVar: v