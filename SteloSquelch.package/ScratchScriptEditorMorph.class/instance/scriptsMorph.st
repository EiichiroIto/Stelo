accessing
scriptsMorph
	^ (pageViewerMorph allMorphs select: [: m | m isKindOf: ScratchScriptsMorph]) first