acccessing
import: aString to: aStageMorph
	| lex list |
	workPane := aStageMorph.
	lex := SexpLexer new read: aString.
	list := SexpParser new parse: lex.
	self importWorld: list.