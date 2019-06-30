private
executionSelectors
	^ self methods
		select:
			[ :each | #('accessing' 'initialization' 'private' 'execution' 'testing') includes: each category ]
		thenCollect: [ :each | each selector ]