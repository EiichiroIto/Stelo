test
fmultiply: anArray size: anInteger by: x
	^ self ffiCall: #(double fmultiplyBy #(FFIExternalArray anArray , int anInteger , double x)) module: SteloLibrary.