initialization
initialize
	"ScratchTheme initialize."

	| dict theme |
	self themeIsInstalled
		ifFalse: [ self getThemes ].
	dict := Dictionary new.
	('Themes' asFileReference directoryNames copyWithout: 'common')
		do: [ :each | 
			theme := self perform: ('build' , each asCamelCase) asSymbol.
			dict at: each asSymbol put: theme ].
	AvailableThemes := dict.
	self changeTheme: AvailableThemes keys anyOne