tests-variables
testVarNames
	| ts ps l |
	ts := STurtles new.
	ts addVariable: 'a'.
	l := ts varNames.
	self assertCollection: l equals: #('color' 'alive' 'x' 'y' 'heading' 'penDown' 'a').
	ts addVariable: 'b'.
	l := ts varNames.
	self assertCollection: l equals: #('color' 'alive' 'x' 'y' 'heading' 'penDown' 'a' 'b').
	ps := SPatches new.
	ps addVariable: 'a'.
	l := ps varNames.
	self assertCollection: l equals: #('color' 'screen' 'x' 'y' 'a').
	ps addVariable: 'b'.
	l := ps varNames.
	self assertCollection: l equals: #('color' 'screen' 'x' 'y' 'a' 'b').