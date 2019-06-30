private
writeHatBlock: aHatBlock for: aMorph
	| code |
	stream
		nextPutAll: '{"event":';
		nextPutAll: (self eventIdFor: aHatBlock eventName) asString;
		nextPutAll: ',"list":['.
	code := StelostCode new parse: aHatBlock target: aMorph.
	self writeCodes: code.
	stream nextPutAll: ']}'.