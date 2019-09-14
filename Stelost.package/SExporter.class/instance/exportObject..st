accessing
exportObject: aMorph
	stream := WriteStream on: ''.
	self writeMorph: aMorph.
	^ stream contents