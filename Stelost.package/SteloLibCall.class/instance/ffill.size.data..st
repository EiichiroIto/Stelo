test
ffill: anArray size: anInteger data: aDouble
	^ self ffiCall: #(void ffill #(FFIExternalArray anArray , int anInteger, double aDouble)) module: SteloLibrary.