menu/button actions
exportMenu
	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	menu add: 'Export S-exp' selector: #exportSexpCode.
	menu add: 'Export Json' selector: #exportJsonCode.
	menu localize.
	^ menu