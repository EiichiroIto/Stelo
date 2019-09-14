stelo funcs
addVariable: str var: vno breed: bno
	^ self ffiCall: #(bool addVariable(int bno, String str, int vno))