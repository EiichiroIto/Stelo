accessing
forceSize: anInteger
	vars
		withIndexDo:
			[ :each :index | each ifNotNil: [ vars at: index put: (each forceTo: anInteger paddingWith: 0) ] ]