private
modelChanged
	^ forceModelChanged or: [ modelExtent ~= sworld extent ]