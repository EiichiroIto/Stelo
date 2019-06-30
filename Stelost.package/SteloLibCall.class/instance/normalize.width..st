stelo funcs
normalize: x width: rows
    ^ self ffiCall: #( int normalize (double x, int rows)) module: SteloLibrary