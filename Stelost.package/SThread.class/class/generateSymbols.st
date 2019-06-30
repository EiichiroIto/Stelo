acccessing
generateSymbols
	"self generateSymbols inspect."
	| w |
	cachedSymbols := { #yield }, self symbols.
	w := WriteStream on: ''.
	w
		nextPutAll: 'enum SteloSymbol {';
		nextPutAll: String lf;
		nextPutAll: '  SS_nop = 0,';
		nextPutAll: String lf.
	cachedSymbols
		withIndexDo: [ :each :index | 
			w
				nextPutAll: '  SS_';
				nextPutAll: each;
				nextPutAll: ',';
				nextPutAll: ' /* ';
				nextPutAll: index asString;
				nextPutAll: ' */';
				nextPutAll: String lf ].
	w
		nextPutAll: '};';
		nextPutAll: String lf.
	^ w contents