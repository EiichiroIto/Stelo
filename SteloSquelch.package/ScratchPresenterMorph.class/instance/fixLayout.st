geometry
fixLayout
	| stageExtent stageBox y totalW x buttonHeight |
	buttonHeight := 50.
	stageExtent := self extent - (buttonHeight * 2).
	stageExtent := 1 @ 1 * (stageExtent x min: stageExtent y).
	stageBox := Rectangle center: self center extent: stageExtent.
	steloDisplay extent: stageExtent.
	steloDisplay position: stageBox topLeft.
	y := stageBox top - (buttonHeight / 2).
	buttons first position: (stageBox left + 5) @ y.
	totalW := (buttons collect: [ :b | b width ] from: 2 to: buttons size) sum.
	x := stageBox right - totalW - (2 * (buttons size - 2)) - 5.
	buttons allButFirst
		do: [ :b | 
			b position: x @ y.
			x := x + b width + 2 ].