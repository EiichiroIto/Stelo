private
importWorld: aCollection
	aCollection first = 'stelo'
		ifFalse: [ self error ].
	aCollection second do: [ :each | workPane assureExistsBreed: each ].
	self importSprites: aCollection third