stelo funcs
getRows
	^ self ffiCall: #(int getRows())