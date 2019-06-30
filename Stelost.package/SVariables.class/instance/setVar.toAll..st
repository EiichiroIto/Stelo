accessing
setVar: anInteger toAll: anObject
	(vars at: anInteger)
		in:
			[ :variable | 1 to: variable size do: [ :each | variable at: each put: anObject ] ].