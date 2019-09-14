private
convert: anEntryPoints eventNo: anInteger
	anEntryPoints breedNoList
		do: [ :each | 
			self
				addList: (anEntryPoints forBreedNo: each)
				eventNo: anInteger
				breedNo: each ]