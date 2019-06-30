accessing
forEventNo: anInteger
	^ eventCodes at: anInteger ifAbsentPut: [ SEventCodes new ]