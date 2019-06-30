instance creation
open
	"ScratchFrameMorph open"

	ScriptableScratchMorph buildBlockSpecDictionary.
	ScratchFrameMorph new
		extent: self initialExtent;
		position: self topLeft;
		startup;
		newScratchProject;
		openInWorld