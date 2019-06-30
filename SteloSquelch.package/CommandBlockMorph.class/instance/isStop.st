accessing
isStop

	^ (selector = #stopThread) | (selector = #stopAll)
