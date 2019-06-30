accessing
classForVarNo: anInteger
	(anInteger = self class colorVarNo or: [ anInteger = self class screenVarNo ])
		ifTrue: [ ^ ByteArray ].
	(anInteger = self class xVarNo or: [ anInteger = self class yVarNo ])
		ifTrue: [ ^ nil ].
	^ super classForVarNo: anInteger