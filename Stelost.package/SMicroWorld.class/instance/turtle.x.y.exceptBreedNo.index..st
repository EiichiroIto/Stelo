command
turtle: bno x: x y: y exceptBreedNo: myBno index: myIndex
	| list |
	list := (self breedsOf: bno) turtlesAtPoint: x @ y.
	bno = myBno
		ifTrue: [ list remove: myIndex ifAbsent: [  ] ].
	^ list isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ list anyOne ].