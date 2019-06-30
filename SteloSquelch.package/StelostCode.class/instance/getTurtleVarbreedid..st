misc ops
getTurtleVarbreedid: aMorph
	| tid bid varName block |
	tid := [ aMorph blockArgs first argString: parser ].
	bid := [ aMorph blockArgs second argString: parser ].
	varName := aMorph blockArgs third choice.
	block := [ :b | targetMorph varFor: varName breed: b ].
	^ bcGenerator getVar: block breedNo: bid index: tid.