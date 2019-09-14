private
addReadouts
	"Add readouts for my target's position and direction."

	| x y label readout s |
	self deleteReadouts.
	readoutMorphs := OrderedCollection new.
	x := nameMorph right + 10.
	y := nameMorph top.
	#(#('count' countAlive) #('size' size))
		do: [ :spec | 
			s := spec first localized , ScratchTranslator colonSuffix.
			label := StringMorph new
				contents: s;
				font: (ScratchFrameMorph getFont: #XYReadout);
				position: x @ y.
			readout := (UpdatingStringMorph
				on: self target
				selector: spec second)
				font: (ScratchFrameMorph getFont: #XYReadoutBold);
				color: (Color gray: 0.8);
				contents: '100,000';
				"growable: false;"
					stepTime: 100;
				position: (label right + 4) @ y.
			self
				addMorph: label;
				addMorph: readout.
			readoutMorphs
				add: label;
				add: readout.
			readout startStepping.
			x := readout right + 2 ].
	readoutMorphs := readoutMorphs asArray