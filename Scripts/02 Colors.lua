GameColor = {
	Difficulty = {
		--[[ These are for 'Custom' Difficulty Ranks. It can be very  useful
		in some cases, especially to apply new colors for stuff you
		couldn't before. (huh? -aj) ]]
		Beginner	= color("#5fbee2"),
		Easy		= color("#ffff00"),	
		Medium		= color("#f16c7c"),
		Hard		= color("#00ff00"),
		Challenge	= color("#cc66ff"),
		Edit		= color("#ffffff"),
		Couple		= color("#ed0972"),	-- hot pink
		Routine		= color("#ff9a00"),	-- orange
		--[[ These are for courses, so let's slap them here in case someone
		wanted to use Difficulty in Course and Step regions. ]]
		Difficulty_Beginner	= color("#5fbee2"),
		Difficulty_Easy		= color("#ffff00"),
		Difficulty_Medium	= color("#f16c7c"),
		Difficulty_Hard		= color("#00ff00"),
		Difficulty_Challenge	= color("#cc66ff"),
		Difficulty_Edit 	= color("#ffffff"),
		Difficulty_Couple	= color("#ed0972"),				-- hot pink
		Difficulty_Routine	= color("#ff9a00")				-- orange
	},
	Stage = {
		Stage_1st	= color("#FFFFFF"),
		Stage_2nd	= color("#FFFFFF"),
		Stage_3rd	= color("#FFFFFF"),
		Stage_4th	= color("#FFFFFF"),
		Stage_5th	= color("#FFFFFF"),
		Stage_6th	= color("#FFFFFF"),
		Stage_Next	= color("#FFFFFF"),
		Stage_Final	= color("#FFFFFF"),
		Stage_Extra1	= color("#FFFFFF"),
		Stage_Extra2	= color("#FFFFFF"),
		Stage_Nonstop	= color("#FFFFFF"),
		Stage_Oni	= color("#FFFFFF"),
		Stage_Endless	= color("#FFFFFF"),
		Stage_Event	= color("#FFFFFF"),
		Stage_Demo	= color("#FFFFFF")
	},
	Judgment = {
		JudgmentLine_W1		= color("#fefed0"),
		JudgmentLine_W2		= color("#f8fd6d"),
		JudgmentLine_W3		= color("#01e603"),
		JudgmentLine_W4		= color("#10e0f1"),
		JudgmentLine_W5		= color("#f70094"),
		JudgmentLine_Held	= color("#f06422"),
		JudgmentLine_Miss	= color("#f70008"),
		JudgmentLine_MaxCombo	= color("#ffb842"),
	},
};

function PlayerColor( pn )
	if pn == PLAYER_1 then
		-- 基本色　167afa
		return color("#00ffff")
	end
	if pn == PLAYER_2 then
		-- 基本色　ff07a2
		return color("#ff00ff")
	end
	return color("1,1,1,1")
end

function PlayerScoreColor( pn )
	if pn == PLAYER_1 then
		return color("#fff90a")
	end
	if pn == PLAYER_2 then
		return color("#fff90a")
	end
	return color("1,1,1,1")
end

-- Evaluationのジャッジラインの枠、通常よりも薄めに
function JudgmentLineToStrokeColor( i )
	local c = GameColor.Judgment[i]
	return { c[1]/6, c[2]/6, c[3]/6, c[4] }
end

-- 難易度暗め、通常よりも暗くした、ScreenSelectMusicの足画像の背景に使う
function CustomDifficultyToDarkColor2( sCustomDifficulty ) 
	local c = GameColor.Difficulty[sCustomDifficulty]
	return { c[1]/3, c[2]/3, c[3]/3, c[4] }
end

function StageToColor( stage )
	return GameColor.Stage[stage] or color("#000000")
end