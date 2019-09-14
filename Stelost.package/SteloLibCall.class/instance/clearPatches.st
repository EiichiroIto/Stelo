stelo funcs
clearPatches
	^ self ffiCall: #(void clearPatches())