private
sampleProgram3
	| program |
	program := SProgram new.
	(program forEventNo: 4) addCodes: #(10 20) forBreedNo: 3.
	^ program