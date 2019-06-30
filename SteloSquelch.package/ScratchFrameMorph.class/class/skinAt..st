scratch skin
skinAt: aSymbolOrString

	^ self skinAt: aSymbolOrString ifAbsent: [self error]
