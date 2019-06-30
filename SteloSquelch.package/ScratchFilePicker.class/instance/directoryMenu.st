private
directoryMenu
	"Present a drop-down menu of all directories in my current path."

	| menu pathParts prefix n choice s str |
	self navigationForbidden
		ifTrue: [ ^ self ].
	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	pathParts := currentDir path segments.
	prefix := ''.
	n := 1.
	pathParts
		do: [ :part | 
			menu add: prefix , part selector: #value: argument: n.
			prefix := prefix , '  '.
			n := n + 1 ].
	pathParts isEmpty
		ifTrue: [ menu add: 'Computer' selector: #value: argument: FileSystem root pathString ].
	self addDriveShortcuts: menu.
	menu
		invokeAt: (directoryBarMorph right - 117) @ (directoryBarMorph top + 8)
		in: self world.
	choice ifNil: [ ^ self ].

	(choice isKindOf: String)
		ifTrue: [ choice = 'Computer'
				ifTrue: [ ^ self currentDirectory: '' ]
				ifFalse: [ ^ self currentDirectory: choice contents ] ].

	s := WriteStream on: String new.
	1 to: choice do: [ :i | 
		s nextPutAll: (pathParts at: i).
		i < choice
			ifTrue: [ s nextPut: currentDir path delimiter ] ].
	str := s contents.
	Smalltalk os isWindows
		ifFalse: [ str := FileSystem disk delimiter asString , str ].
	self currentDirectory: str.