accessing
addCodes: aCollection forBreedNo: anInteger
	| list |
	list := breeds at: anInteger ifAbsentPut: [ OrderedCollection new ].
	list add: aCollection asArray copy.