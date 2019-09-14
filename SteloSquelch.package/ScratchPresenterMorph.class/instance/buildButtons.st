initialization
buildButtons
	| button |
	buttons := #(
		#(presentationExit	exitPresentation		'Exit presentation')
		#(clearTurtles			clearTurtles			'Clear Turtles')
		#(clearGraphics		clearGraphics			'Clear Graphics')
		#(setup						startSetup				'Start Setup Scripts')
		#(go							#startLoop						'Start Loop Scripts')
		#(stop						stopAll						'Stop everything')
	)
		collect: [ :spec | 
			button := ToggleButton
				onForm: (ScratchFrameMorph skinAt: spec first , 'ButtonBlackPressed')
				offForm: (ScratchFrameMorph skinAt: spec first , 'ButtonBlack')
				overForm: (ScratchFrameMorph skinAt: spec first , 'ButtonBlackPressed').
			button
				target: self;
				actionSelector: spec second;
				isMomentary: true;
				actWhen: #buttonUp;
				setBalloonText: spec third localized;
					off.
			#startLoop = spec second
				ifTrue: [ flagButton := button ].
			button ].
	buttons do: [ :b | self addMorph: b ].