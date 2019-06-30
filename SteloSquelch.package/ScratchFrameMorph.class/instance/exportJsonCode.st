menu/button actions
exportJsonCode
	| cpp ret |
	cpp := SJsonExporter new.
	ret := cpp exportFrom: workPane.
	ret inspect.