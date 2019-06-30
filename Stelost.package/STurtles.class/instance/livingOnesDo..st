enumerating
livingOnesDo: aBlock
	| aliveVar |
	aliveVar := variables arrayOfVarNo: STurtleVarId aliveVarNo.
	aliveVar
		withIndexDo: [ :each :index | 
			each
				ifTrue: [ aBlock value: index ] ]