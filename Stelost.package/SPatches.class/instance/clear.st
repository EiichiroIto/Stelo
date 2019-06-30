command
clear
	variables setVar: varId class colorVarNo toAll: SColorList black.
	varId userDefinedVarNos do: [ :each | variables clearVarNo: each ].