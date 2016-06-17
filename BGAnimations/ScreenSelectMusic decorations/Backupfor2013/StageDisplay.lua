-- Base from DDR5thMix by AJ 187

-- local sStage = GAMESTATE:GetCurrentStage();
-- LongやMarathonをプレイ後には正しいステージ数を出さないため使用しない、直ったら作り直すかも

local c;
local curStageNum = GAMESTATE:GetCurrentStageIndex()+1; -- 0-based
local maxStages = PREFSMAN:GetPreference("SongsPerPlay")
local UseLongMarathonStage = getenv("GetUseLongMarathonStage");

return Def.ActorFrame {
	InitCommand=function(self) c = self:GetChildren(); end;
	LoadFont("_cooper black 20px") .. {
		Name="Under";
		InitCommand=cmd(diffuse,color("#000000");strokecolor,color("#ffffff");zoom,1;uppercase,true;maxwidth,WideScale(190,250);y,-28;x,-255);
	};	
--	LoadFont("_banque Gothique RR Bold") .. {
--		Name="Over";
--		InitCommand=cmd(diffuse,color("#e02820");strokecolor,color("#ffffff");zoom,0.75;uppercase,true;maxwidth,WideScale(190,250));
--	};
	SetCommand=function(self)
		local stageText;
		if GAMESTATE:IsEventMode() then
			stageText = FormatNumberAndSuffix(curStageNum)
		elseif GAMESTATE:IsExtraStage() then
			stageText = "EXTRA";
		elseif GAMESTATE:IsExtraStage2() then
			stageText = "ENCORE EXTRA";
		else
			local song = GAMESTATE:GetCurrentSong();
			local songStages = 0;
			if song then
				if song:IsLong() then
					songStages = 1;
				elseif song:IsMarathon() then
					songStages = 2;
				end
				local totalStages = curStageNum+songStages+UseLongMarathonStage
				if totalStages == maxStages then
					stageText = "FINAL"
				else
					stageText = FormatNumberAndSuffix(curStageNum+UseLongMarathonStage)
				end
			else
				if curStageNum+UseLongMarathonStage == maxStages then
					stageText = "FINAL"
				else
					stageText = FormatNumberAndSuffix(curStageNum+UseLongMarathonStage)
				end;
			end
		end;
		c.Under:settext(stageText.." STAGE");
		c.Over:settext(stageText.." ####=");
	end;
	CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set");
};