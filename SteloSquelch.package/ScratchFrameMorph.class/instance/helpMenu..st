menu/button actions
helpMenu: aMenuTitleMorph
	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	menu add: 'Update Font List' selector: #updateFontList.
	sworldMode = #SMicroWorld
		ifTrue: [ menu add: 'Change PluginWorld' selector: #changePluginWorld ]
		ifFalse: [ menu add: 'Change MicroWorld' selector: #changeMicroWorld ].
	menu addLine.
	menu add: 'About Stelo' selector: #aboutStelo.
	Sensor shiftPressed
		ifTrue: [ menu addLine.
			UseErrorCatcher
				ifTrue: [ menu add: 'turn error catching off' selector: #toggleErrorCatcher ]
				ifFalse: [ menu add: 'turn error catching on' selector: #toggleErrorCatcher ] ].
	menu localize.
	#(3)
		do: [ :n | 
			| item |
			item := menu items at: n.
			item contents: item contents , ScratchTranslator ellipsesSuffix ].
	menu invokeAt: aMenuTitleMorph bottomLeft + (0 @ 10) in: self world