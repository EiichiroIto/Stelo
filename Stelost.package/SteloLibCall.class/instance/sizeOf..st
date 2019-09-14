stelo funcs
sizeOf: bno
	^ self ffiCall: #(int size(int bno))