adding
addDriveShortcuts: menu
	| drives visible |
	menu addLine.
	Smalltalk os platformName = WindowsResolver platformName
		ifTrue: [
			drives := FileSystem root directoryNames.
			drives := drives copyWithout: 'Network'.
			drives := drives copyWithout: 'automount/Servers'.
			(visible := ScratchFrameMorph visibleDrives)
				ifNotNil: [ drives := drives select: [ :drive | visible includes: drive asUppercase ] ].
			drives do: [ :drive | menu add: drive selector: #value: argument: drive ].
			^ self ].
	Smalltalk os platformName = MacOSResolver platformName
		ifTrue: [
			drives := '/Volumes' asFileReference directoryNames.
			(visible := ScratchFrameMorph visibleDrives)
				ifNotNil: [ drives := drives select: [ :drive | visible includes: drive asUppercase ] ].
			drives := drives
				do: [ :drive | menu add: drive selector: #value: argument: '/Volumes/' , drive ].
			^ self ].