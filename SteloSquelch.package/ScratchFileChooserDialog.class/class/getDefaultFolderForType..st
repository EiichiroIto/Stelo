accessing
getDefaultFolderForType: type

	| mediaDir |
	(#(project export) includes: type) ifTrue: [^ self userScratchProjectsDir].

	(FileSystem workingDirectory / 'Media') isDirectory ifTrue: [
		mediaDir := FileSystem workingDirectory / 'Media'.
		#background = type ifTrue: [
			(mediaDir / 'Backgrounds') isDirectory ifTrue: [
				^ mediaDir / 'Backgrounds']].
		(#(costume sprite) includes: type) ifTrue: [
			(mediaDir / 'Costumes') isDirectory ifTrue: [
				^ mediaDir / 'Costumes']].
		#sound = type ifTrue: [
			(mediaDir / 'Sounds') isDirectory ifTrue: [
				^ mediaDir / 'Sounds']]].

	^ self homeDir
