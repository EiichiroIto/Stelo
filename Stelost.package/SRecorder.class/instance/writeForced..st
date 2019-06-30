accessing
writeForced: aBoolean
	self isOpen
		ifFalse: [ ^ self ].
	count := count + 1.
	(aBoolean or: [ count >= rate ])
		ifFalse: [ ^ self ].
	writer nextPutImage: self makeForm.
	count := 0.