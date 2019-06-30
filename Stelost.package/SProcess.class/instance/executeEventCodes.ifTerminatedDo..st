execution
executeEventCodes: anEventCodes ifTerminatedDo: aBlock
	1 to: world breedsCount do: [ :bno | 
		| codes |
		codes := anEventCodes forBreedNo: bno.
		codes
			do: [ :code | 
				world
					livingBreedNo: bno
					do: [ :index | 
						self
							executeThread: code
							breedNo: bno
							index: index
							ifTerminatedDo: aBlock ] ] ].