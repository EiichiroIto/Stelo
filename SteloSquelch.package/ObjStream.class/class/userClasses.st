class initialization
userClasses
	"Answer an array of (<class id>, <class name>) records for all version numbered user classes."
	"The following finds obsolete user classes:"
	"self initialize. self userClasses reject: [:rec | Smalltalk includesKey: rec second]"

	^ #(
		"id		class"
		(100		Morph)
		(101		BorderedMorph)
		"(102		RectangleMorph)"
		(103		EllipseMorph)
		(104		AlignmentMorph)
		(105		StringMorph)
		"(106		UpdatingStringMorph)"
		"(106		UpdatingStringMorphWithParameter)"
		"(107		SimpleSliderMorph)"
		(108		SimpleButtonMorph)
		"(109		SampledSound)"
		(110		ImageMorph)
		"(111		SketchMorph)"

		"(120		SBreed)"
		(121		SPatches)
		"(122		SMicroWorld)"
		(123		SVariables)
		(124		SVarId)
		(125		SteloStageMorph)
		(126		SteloPatchMorph)
		(127		SteloTurtleMorph)
		(128 	SDisplay)
		(129 	SBreedId)
		(130 	SEventId)
		(131 	SPatchVarId)
		(132 	STurtleVarId)
		(133 	STurtles)
		(134 	SObserver)
		(135 	SObserverVarId)

		(140		ChoiceArgMorph)
		(141		ColorArgMorph)
		(142		ExpressionArgMorph)
		"(143	ParameterReferenceMorph)"
		"(144	PositionArgMorph)"
		(145		SpriteArgMorph)
		"(146	VariableArgMorph)"
		(147		BlockMorph)
		(148		CommandBlockMorph)
		(149		CBlockMorph)
		"(150	MethodCallBlockMorph)"
		(151		HatBlockMorph)
		"(152	ScratchButtonMorph)"
		(153		ScratchScriptsMorph)
		"(154		ScratchSliderMorph)"
		"(155		WatcherMorph)"
		"(156	ParameterMorph)"
		(157		SetterBlockMorph)
		(158		EventHatMorph)
		(159		SubHatMorph)
		(160		VariableBlockMorph)
		"(161		IACTHatBlock)"
		"(162		ImageMedia)"
		"(163		MovieMedia)
		(164		SoundMedia)
		(165		KeyEventHatMorph)"
		(166		BooleanArgMorph)
		(167		EventTitleMorph)
		"(168		MouseClickEventHatMorph)"
		(169		ExpressionArgMorphWithMenu)
		"(170		ReporterBlockMorph)"
		(171		MultilineStringMorph)
		(172		ToggleButton)
		"(173		WatcherReadoutFrameMorph)"
		"(174		WatcherSliderMorph)"
		"(175		ScratchListMorph)"
		(176		ScrollingStringMorph)
	)
