accessing
restoreBreeds: aCollection
	plugin reset.
	aCollection do: [ :each | self setupBreed: each ].