samples
sample2
	"SMicroWorld sample2."

	| world d p pr eventId |
	world := SMicroWorld new.
	eventId := SEventId new.
	eventId newNo.
	d := SDisplay microworld: world.
	world createPatchOrder: 100.
	d openInWorld.
	pr := SProgram new.
	(pr forEventNo: SEventId setupEventNo)
		addCodes: #(100 3 #createTurtles 4 #broadcast) forBreedNo: SBreedId observerBreedNo.
	(pr forEventNo: 4)
		addCodes: #(30 #forward) forBreedNo: SBreedId turtleBreedNo.
	p := SProcess microworld: world program: pr.
	p setup.
	p setupCont.
	p loop.
	^ d.