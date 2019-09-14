intialization
createStageButtonsPanel
	"Create and add a panel containing the project title, green flag, and stop buttons."

	| buttonSpecs bName button |
	"create panel"
	stageButtonsPanel := AlignmentMorph new
		color: Color transparent;
		listCentering: #center;
		height: 20.
	projectTitleMorph := StringMorph new
		contents: '';
		font: (ScratchFrameMorph getFont: #FrameMorphProjectTitle).
	stageButtonsPanel
		addMorphBack: projectTitleMorph;
		addMorphBack: (AlignmentMorph newSpacer: Color transparent).

	"buttonSpecs defines the toolbar buttons; first is icon name, second is selector"
	buttonSpecs := #(
		"name	selector		tool tip"
		#(clearTurtles		clearTurtles		'Clear turtles')
		#(clearGraphics	clearGraphics		'Clear graphics')
		#(setup					startSetup			'Start setup')
		#(stop					stopAll					'Stop everything')
		#(step					stepLoop				'Step loop')
		#(loopSlow			startLoopSlow		'Start loop slowly')
		#(loop					startLoop				'Start loop')
		).
	buttonSpecs
		do: [ :spec | 
			bName := spec first.
			button := ToggleButton
				onForm: (ScratchFrameMorph skinAt: (bName , 'ButtonPressed') asSymbol)
				offForm: (ScratchFrameMorph skinAt: (bName , 'ButtonGray') asSymbol)
				overForm: (ScratchFrameMorph skinAt: (bName , 'ButtonPressed') asSymbol).
			button
				target: self;
				actionSelector: (spec at: 2);
				isMomentary: true;
				setBalloonText: (spec at: 3) localized.
			stageButtonsPanel addMorphBack: button.
			bName = #loop
				ifTrue: [ flagButton := button.
					stageButtonsPanel
						addMorphBack:
							(Morph new
								color: Color transparent;
								extent: 2 @ 5) ] ].
	titlePane addMorph: stageButtonsPanel