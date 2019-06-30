test
isum: anArray size: anInteger
	^ self ffiCall: #(int isum #(int *anArray , int anInteger)) module: SteloLibrary.