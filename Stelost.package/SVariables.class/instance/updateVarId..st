accessing
updateVarId: aVarId
	| newVarNames newVars index v size class |
	newVarNames := aVarId varNames asArray.
	varNames = newVarNames
		ifTrue: [ ^ self ].
	size := vars ifNil: [ 0 ] ifNotNil: [ vars first size ].
	newVars := newVarNames
		collect: [ :each | 
			index := varNames indexOf: each.
			index = 0
				ifTrue: [ v := aVarId varNoFor: each.
					class := (aVarId classForVarNo: v).
					class ifNotNil: [ class new: size ]]
				ifFalse: [ vars at: index ] ].
	vars := newVars.
	varNames := newVarNames.