local function CurGameName()
	return GAMESTATE:GetCurrentGame():GetName()
end
-- GameCompatibleModes:
-- [en] returns possible modes for ScreenSelectPlayMode
function GameCompatibleModes()
	local Modes = {
		dance = "Single,Solo,Versus,Couple,Double",
		pump = "Single,Double,HalfDouble,Versus,Couple,Routine",
		beat = "5Keys,7Keys,10Keys,14Keys,Versus5,Versus7",
		kb7 = "KB7",
		para = "Single",
		maniax = "Single,Double,Versus",
		-- todo: add versus modes for technomotion
		techno = "Single4,Single5,Single8,Double4,Double5,Double8",
		lights = "Single" -- lights shouldn't be playable
	}
	return Modes[CurGameName()]
end

-- ComboContinue:
-- [en] 
function ComboContinue()
	local Continue = {
		dance = "TapNoteScore_W4",
		pump = "TapNoteScore_W3",
		beat = "TapNoteScore_W3",
		kb7 = "TapNoteScore_W3",
		para = "TapNoteScore_W4"
	}
	return Continue[CurGameName()]
end

function ComboMaintain()
	local Maintain = {
		dance = "TapNoteScore_W4",
		pump = "TapNoteScore_W4",
		beat = "TapNoteScore_W3",
		kb7 = "TapNoteScore_W3",
		para = "TapNoteScore_W4"
	}
	return Maintain[CurGameName()]
end