private
fixVars: varId
	| desirableClass |
	varId regularize.
	self updateVarId: varId.
	vars
		withIndexDo: [ :each :index | 
			each
				ifNotNil: [ desirableClass := varId classForVarNo: index.
					desirableClass
						ifNil: [ vars at: index put: nil ]
						ifNotNil: [ each class ~= desirableClass
								ifTrue: [ vars at: index put: (each as: desirableClass) ] ] ] ]