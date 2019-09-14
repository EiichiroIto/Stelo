menu/button ops
scriptsMenu: aPosition
	"Present a menu of Scratch script operations."

	| menu choice |
	self target ifNil: [^ self].
	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	menu add: 'add sub block' selector: #value: argument: #addSubBlock:.
	menu addLine.
	menu add: 'clean up' selector: #value: argument: #cleanUp.
	menu add: 'save picture of scripts' selector: #value: argument:#saveScriptsToImage.
	menu add: 'add comment' selector: #value: argument:#addComment:.
	menu localize.
	menu invokeAt: self activeHand position in: self world allowKeyboard: false.

	choice ifNil: [^ self].

	(#(addComment: addSubBlock:) includes: choice)
		ifTrue: [self perform: choice with: aPosition]
		ifFalse: [self perform: choice].