enumerating
deadOnesDo: aBlock
	| aliveVar |
	aliveVar := variables arrayOfVarNo: STurtleVarId aliveVarNo.
	aliveVar
		withIndexDo: [ :each :index | 
			each
				ifFalse: [ aBlock value: index ] ]