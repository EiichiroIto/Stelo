menu/button actions
exportCppCode
	| cpp ret |
	cpp := SCppExporter new.
	ret := cpp exportFrom: workPane.
	ret inspect.