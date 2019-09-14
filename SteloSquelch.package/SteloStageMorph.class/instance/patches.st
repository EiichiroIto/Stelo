private
patches
	^ (sprites collect: #breed)
		detect: [ :each | each breedNo = SBreedId patchBreedNo ]