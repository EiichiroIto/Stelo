test
doubleNumber: anInteger
    ^ self ffiCall: #( int doublenumber (int anInteger)) module: SteloLibrary