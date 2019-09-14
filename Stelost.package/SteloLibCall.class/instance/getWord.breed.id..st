stelo funcs
getWord: vno breed: bno id: tno
	^ self ffiCall: #(uint32 getWord(int bno, int vno, int tno))