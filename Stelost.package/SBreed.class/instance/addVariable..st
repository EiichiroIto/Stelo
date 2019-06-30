accessing
addVariable: aString
	| id |
	id := varId add: aString.
	variables updateVarId: varId.
	^ id