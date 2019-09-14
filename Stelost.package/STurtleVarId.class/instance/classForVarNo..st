accessing
classForVarNo: anInteger
	anInteger = self class flagVarNo
		ifTrue: [ ^ ByteArray ].
	anInteger = self class colorVarNo
		ifTrue: [ ^ ByteArray ].
	^ super classForVarNo: anInteger.