-- Base from DDR5thMix by AJ 187

-- local sStage = GAMESTATE:GetCurrentStage();
-- LongやMarathonをプレイ後には正しいステージ数を出さないため使用しない、直ったら作り直すかも

local curStageNum = GAMESTATE:GetCurrentStageIndex(); -- 0-based
local maxStages = PREFSMAN:GetPreference("SongsPerPlay")
local UseLongMarathonStage = getenv("GetUseLongMarathonStage");

return Def.ActorFrame {
	InitCommand=function(self) c = self:GetChildren(); end;
	LoadFont("_cooper black 20px") .. {
		Name="Under";
		InitCommand=cmd(diffuse,color("#000000");strokecolor,color("#FFFFFF");zoom,1;uppercase,true);
	};
--[[	LoadFont("_banque Gothique RR Bold") .. {
		Name="Over";
		InitCommand=cmd(diffuse,color("#e02820");strokecolor,color("#ffffff");zoom,0.75;uppercase,true);
	};]]--
	BeginCommand=cmd(playcommand,"Set");
	SetCommand=function(self, params)
		local stageText;
		if GAMESTATE:IsEventMode() then
			stageText = FormatNumberAndSuffix(curStageNum)
		elseif GAMESTATE:HasEarnedExtraStage() then
			if GAMESTATE:IsExtraStage() then
				stageText = "FINAL";
			elseif GAMESTATE:IsExtraStage2() then
				stageText = "EXTRA"
			end;
		else
			local totalStages = curStageNum+UseLongMarathonStage;
			if GAMESTATE:IsExtraStage() then
				stageText = "EXTRA"
			elseif GAMESTATE:IsExtraStage2() then
				stageText = "ENCORE EXTRA"
			elseif totalStages == maxStages then
				stageText = "FINAL";
			else
				local song = GAMESTATE:GetCurrentSong()
				local songStages = 0;
				if song:IsLong() then
					songStages = 1;
				elseif song:IsMarathon() then
					songStages = 2;
				end;
				stageText = FormatNumberAndSuffix(curStageNum+UseLongMarathonStage-songStages);
			end
		end;
	--[[
		elseif GAMESTATE:IsExtraStage() then
			if totalStages == maxStages then
				stageText = "FINAL";
			else
				stageText = "EXTRA"
			end
		elseif GAMESTATE:IsExtraStage2() then
			if totalStages == maxStages+1+songStages then
				stageText = "EXTRA"
			else
				stageText = "ENCORE EXTRA"
			end
		else
			if totalStages == maxStages then
				stageText = "FINAL";
			else
				stageText = FormatNumberAndSuffix(curStageNum+UseLongMarathonStage-songStages);
			end
		end;
	--]]
		c.Under:settext(stageText.." STAGE");
		c.Over:settext(stageText.." ####=");
	end;
};