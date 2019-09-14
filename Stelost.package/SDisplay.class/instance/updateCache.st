private
updateCache
	forceModelChanged := false.
	modelExtent := sworld extent.
	cell := self extent // modelExtent.
	offset := (self extent - (modelExtent * cell)) // 2.