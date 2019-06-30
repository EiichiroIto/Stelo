tests-accessing
testRegularize
	| v |
	v := SPatchVarId new.
	self assertCollection: v varNames equals: #('color' 'screen' 'x' 'y').
	self assert: v privNextNo equals: 5.
	v privVarNames: #('color' 'x' 'y') asOrderedCollection.
	v privNextNo: 4.
	v regularize.
	self assertCollection: v varNames equals: #('color' 'screen' 'x' 'y').
	self assert: v privNextNo equals: 5.
	v privVarNames: #('color' 'x' 'y' 'a' 'b') asOrderedCollection.
	v privNextNo: 4.
	v regularize.
	self assertCollection: v varNames equals: #('color' 'screen' 'x' 'y' 'a' 'b').
	self assert: v privNextNo equals: 7