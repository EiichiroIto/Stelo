startup
startup
	ScriptableScratchMorph randomInit.
	ScratchTranslator detectRenderPlugin.
	ScratchTranslator importLanguagesList.
	self processSettingsFile.
	self updateProjectName.
	author := ''.
	justSaved := true.
	self enterQuarterModeIfSmallScreen.
	viewerPane currentCategory: 'observer'.
	self newScratchProject.