private
addList: aCollection eventNo: eno breedNo: bno
	| dict |
	dict := breeds at: bno ifAbsentPut: [ Dictionary new ].
	dict at: eno ifPresent: [ self error ] ifAbsentPut: [ aCollection ]