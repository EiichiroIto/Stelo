private
setWordAll: vno breed: bno from: anArray
	| ext |
	ext := FFIExternalArray externalNewType: 'uint32' size: anArray size.
	anArray
		withIndexDo: [ :each :index | each ifNotNil: [ ext at: index put: each ] ].
	plugin setWordAll: vno breed: bno extArray: ext size: anArray size.