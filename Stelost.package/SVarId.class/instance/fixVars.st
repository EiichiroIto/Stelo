accessing
fixVars
	| list |
	list := OrderedCollection new.
	varNames
		do: [ :each | 
			(list includes: each)
				ifFalse: [ list add: each ] ].
	varNames := list.