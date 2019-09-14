stelo funcs
getWordAll: vno breed: bno
	^ self ffiCall: #(byte *getWordAll(int bno, int vno))