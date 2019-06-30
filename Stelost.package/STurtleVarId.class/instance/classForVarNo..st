accessing
classForVarNo: anInteger
	(anInteger = self class aliveVarNo or: [ anInteger = self class penDownVarNo ])
		ifTrue: [ ^ Array ].
	anInteger = self class colorVarNo
		ifTrue: [ ^ ByteArray ].
	^ super classForVarNo: anInteger.