-- Base from DDR5thMix by AJ 187

-- local sStage = GAMESTATE:GetCurrentStage();
-- LongやMarathonをプレイ後には正しいステージ数を出さないため使用しない、直ったら作り直すかも

local curStageNum = GAMESTATE:GetCurrentStageIndex()+1; -- 0-based
local maxStages = PREFSMAN:GetPreference("SongsPerPlay");
local UseLongMarathonStage = getenv("GetUseLongMarathonStage");
local StageDisplay=0;

return LoadFont("ScreenGameplay","StageDisplay") .. {
	InitCommand=cmd(zoomx,1.4;zoomy,1.1;maxwidth,144);
	SetCommand=function(self, params)
		local stageText;
		if GAMESTATE:IsCourseMode() then
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
			StageDisplay=StageDisplay+1
			-- Endless Modeの時はファイナルステージ表示をさせない
			if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
				stageText = FormatNumberAndSuffix(StageDisplay);
			else
				if coursestages == StageDisplay then
					stageText = 'FINAL';
				else
					stageText = FormatNumberAndSuffix(StageDisplay);
				end;
			end
		else
			local song = GAMESTATE:GetCurrentSong()
			local songStages = 0;
			if song:IsLong() then
				songStages = 1;
			elseif song:IsMarathon() then
				songStages = 2;
			end;
			if GAMESTATE:IsEventMode() then
				stageText = FormatNumberAndSuffix(curStageNum)
			elseif GAMESTATE:IsExtraStage() then
				stageText = "EXTRA";
			elseif GAMESTATE:IsExtraStage2() then
				stageText = "ENCORE EXTRA";
			else
				local totalStages = curStageNum+songStages+UseLongMarathonStage;
				if totalStages == maxStages then
					stageText = "FINAL";
				else
					stageText = FormatNumberAndSuffix(curStageNum+UseLongMarathonStage);
				end
			end;
		end;
		self:settext( stageText );
		self:y(42);
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};