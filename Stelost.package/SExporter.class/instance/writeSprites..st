private
writeSprites: aCollection
	aCollection do: [ :each | self writeMorph: each ].