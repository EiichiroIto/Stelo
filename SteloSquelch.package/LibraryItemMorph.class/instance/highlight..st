accessing
highlight: aBoolean

	| labelColor |
	isSelected = aBoolean ifTrue: [^ self].

	isSelected := aBoolean.
	isSelected
		ifTrue: [
			rolloverOn := false.
			highlightForm extent: self extent.
			currentForm := highlightForm.
			self addMorphBack: (currentForm position: (self position + (0@0))).
			labelColor := ScratchFrameMorph labelOnColor]
		ifFalse: [
			currentForm ifNotNil: [
				currentForm delete.
				currentForm := nil].
			labelColor := ScratchFrameMorph labelOffColor].

	nameMorph color: labelColor.
	"scriptCountMorph color: labelColor darker."
	self changed.
