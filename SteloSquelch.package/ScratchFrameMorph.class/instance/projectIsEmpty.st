private
projectIsEmpty
	| allScriptables |
	workPane submorphs size > 1
		ifTrue: [ ^ false ].
	workPane submorphs size = 1
		ifTrue: [ (workPane submorphs first isKindOf: SteloTurtleMorph)
				ifFalse: [ ^ false ] ].
	allScriptables := workPane submorphs copyWith: workPane.
	allScriptables
		do: [ :m | 
			m blocksBin submorphs size > 0
				ifTrue: [ ^ false ].
			m varNames size > 1
				ifTrue: [ ^ false ] ].
	^ true.