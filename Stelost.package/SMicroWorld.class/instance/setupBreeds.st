private
setupBreeds
	breeds := Array new: breedId size.
	breeds at: SBreedId observerBreedNo put: self.
	breeds at: SBreedId patchBreedNo put: SPatches new.
	self newBreed.