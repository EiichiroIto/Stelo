instance creation
data: anObject
	^ self basicNew
		initialize;
		data: anObject;
		yourself