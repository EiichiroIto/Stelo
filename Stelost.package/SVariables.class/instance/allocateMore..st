accessing
allocateMore: anInteger
	| more |
	more := anInteger roundUpTo: 100.
	vars withIndexDo: [ :each :index | vars at: index put: (each grownBy: more) ].