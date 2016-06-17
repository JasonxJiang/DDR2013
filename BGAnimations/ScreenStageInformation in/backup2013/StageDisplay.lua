-- Base from DDR5thMix by AJ 187

-- local sStage = GAMESTATE:GetCurrentStage();
-- LongやMarathonをプレイ後には正しいステージ数を出さないため使用しない、直ったら作り直すかも

local curStageNum = GAMESTATE:GetCurrentStageIndex()+1; -- 0-based
local maxStages = PREFSMAN:GetPreference("SongsPerPlay")
local UseLongMarathonStage = getenv("GetUseLongMarathonStage");

return LoadFont("_impact 60px") .. {
	BeginCommand=cmd(playcommand,"Set";);
	SetCommand=function(self, params)
		local stageText;
		if GAMESTATE:IsCourseMode() then
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
			if coursestages == 1 then
				if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
					stageText = "1st STAGE";
				else
					stageText = "FINAL STAGE";
				end;
			else
				stageText = "1st STAGE";
			end;
		else
			local song = GAMESTATE:GetCurrentSong()
			local songStages = 0;
			if song:IsLong() then
				songStages = 1;
			elseif song:IsMarathon() then
				songStages = 2;
			end;
			if GAMESTATE:IsEventMode() then
				stageText = FormatNumberAndSuffix(curStageNum).." STAGE"
			elseif GAMESTATE:IsExtraStage() then
				stageText = "EXTRA STAGE"
			elseif GAMESTATE:IsExtraStage2() then
				stageText = "ENCORE EXTRA STAGE"
			else
				local totalStages = curStageNum+songStages+UseLongMarathonStage;
				if totalStages == maxStages then
					stageText = "FINAL STAGE";
				else
					stageText = FormatNumberAndSuffix(curStageNum+UseLongMarathonStage).." STAGE";
				end
			end;
		end;
		self:settext( stageText );
	end;
};