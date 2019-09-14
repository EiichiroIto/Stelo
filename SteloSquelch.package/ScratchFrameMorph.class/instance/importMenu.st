menu/button actions
importMenu
	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	menu add: 'Import S-exp' selector: #importSexpCode.
	menu localize.
	^ menu