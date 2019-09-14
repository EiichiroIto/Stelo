variables
turtleVarNamesMenu
	| list |
	list := OrderedCollection new.
	self stageMorph turtleMorphs
		do: [ :each | list addAll: each breed userDefinedVarNames ].
	^ list