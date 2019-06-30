initialization
forStartupEvent

	| parts s |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when setup'.

	s := StringMorph new contents: parts first; font: (ScratchFrameMorph getFont: #Label); color: Color white.
	self addMorphBack: s.

	s := s veryDeepCopy contents: parts second.
	self addMorphBack: s.

	"create scriptNameMorph but don't add it"
	scriptNameMorph := EventTitleMorph new eventName: #startup.

	self fixBlockLayout.
