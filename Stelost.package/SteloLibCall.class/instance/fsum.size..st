test
fsum: anArray size: anInteger
	^ self ffiCall: #(double fsum #(FFIExternalArray anArray , int anInteger)) module: SteloLibrary.