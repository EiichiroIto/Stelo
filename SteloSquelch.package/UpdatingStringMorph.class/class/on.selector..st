instance creation
on: anObject selector: aSymbol
	^ self basicNew initialize
		target: anObject;
		selector: aSymbol;
		yourself