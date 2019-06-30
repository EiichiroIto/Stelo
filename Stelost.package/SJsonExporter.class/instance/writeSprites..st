private
writeSprites: aCollection
	aCollection do: [ :each | self writeMorph: each ] separatedBy: [ stream nextPut: $, ]