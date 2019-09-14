acccessing
importScript: aString to: aMorph
	| lex list |
	lex := SexpLexer new read: aString.
	list := SexpParser new parse: lex.
	list first = 'for'
		ifFalse: [ ^ self ].
	list third do: [ :v | aMorph addVariable: v ].
	self importScripts: list fourth for: aMorph.