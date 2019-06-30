dropping/grabbing
acceptDroppingMorph: aMorph event: evt
	"This method allows re-ordering of media in the costumes and sounds tabs."

	| editor mediaItems |
	((editor := self meOrOwnerThatIsA: ScratchScriptEditorMorph) notNil)
		ifFalse: [^ super acceptDroppingMorph: aMorph event: evt].

	"editor target insertMedia: aMorph media before: nil."
