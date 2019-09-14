stelo funcs
countAliveOf: bno
	^ self ffiCall: #(int countAlive(int bno))