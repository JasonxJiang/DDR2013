local Player = ...
assert(Player,"MachineRecord needs Player")

-- GetMachineHighScoreIndexはイベントモード時に動かないため、マシンハイスコアを呼び出して直に比較させる
-- 使用するのはプロフィール未使用時だけ

local t = Def.ActorFrame{};
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local record = stats:GetMachineHighScoreIndex()
local hasMachineRecord = record ~= -1
local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player):GetScore()
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

--[[
t[#t+1] = LoadFont("_russellsquare Bold 24px")..{
	InitCommand=cmd(zoom,2);
	BeginCommand=function(self)
		if PROFILEMAN:IsPersistentProfile(Player) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or Var "LoadingScreen" == "ScreenEvaluationSummary" or Var "LoadingScreen" == "ScreenEvaluationSummary2" then return end;
		if GAMESTATE:IsCourseMode() then
			if score ~= 0 and record == 0 then
				self:visible(true);
			end;
		else
			local profile = PROFILEMAN:GetMachineProfile();
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(Player):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			local radar = steps:GetRadarValues(Player);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);

			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local topscore=0;
			if scores[1] then
				for i = 1, #scores do
					if scores[i] then
						local topscore2 = GetNormalScore(maxsteps,scores[i],Player);
						if topscore2 > topscore then
							topscore = topscore2;
						end;
					else
						break;
					end;
				end;
			end;
			assert(topscore);
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
			local getscore = GetEvaScore(maxsteps,pss,Player);
			self:settext(topscore);
		end;
	end;
	OffCommand=cmd(linear,0.25;zoomy,0);
};
--]]

t[#t+1] = LoadFont("_russellsquare Bold 24px")..{
	Text="It's a New Record!";
	InitCommand=cmd(visible,false;zoomx,0.663;zoomy,0;sleep,2.3;linear,0.25;zoomy,0.527;diffuse,color("#ffd802");diffusetopedge,color("#ffffff");strokecolor,color("#000000");skewx,-0.2;pulse;effectperiod,0.5;effectmagnitude,1,1.025,0);
	BeginCommand=function(self)
		if PROFILEMAN:IsPersistentProfile(Player) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or Var "LoadingScreen" == "ScreenEvaluationSummary" or Var "LoadingScreen" == "ScreenEvaluationSummary2" then return end;
		if GAMESTATE:IsCourseMode() then
			if score ~= 0 and record == 0 then
				self:visible(true);
			end;
		else
			local profile = PROFILEMAN:GetMachineProfile();
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(Player):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			local radar = steps:GetRadarValues(Player);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local topscore=0;
			if scores[1] then
				for i = 1, #scores do
					if scores[i] then
						local topscore2 = GetNormalScore(maxsteps,scores[i],Player);
						if topscore2 > topscore then
							topscore = topscore2;
						end;
					else
						break;
					end;
				end;
			end;
			assert(topscore);
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
			local getscore = GetEvaScore(maxsteps,pss,Player);
			if getscore ~= 0 and getscore >= topscore then
				self:visible(true);
			end;
		end;
	end;
	OffCommand=cmd(linear,0.25;zoomy,0);
};

t[#t+1] = LoadActor(THEME:GetPathS("", "NewRecord"))..{
	BeginCommand=function(self)
		if PROFILEMAN:IsPersistentProfile(Player) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or Var "LoadingScreen" == "ScreenEvaluationSummary" or Var "LoadingScreen" == "ScreenEvaluationSummary2" then return end;
		if GAMESTATE:IsCourseMode() then
			if score ~= 0 and record == 0 then
				self:play();
			end;
		else
			local profile = PROFILEMAN:GetMachineProfile();
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(Player):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			local radar = steps:GetRadarValues(Player);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local topscore=0;
			if scores[1] then
				for i = 1, #scores do
					if scores[i] then
						local topscore2 = GetNormalScore(maxsteps,scores[i],Player);
						if topscore2 > topscore then
							topscore = topscore2;
						end;
					else
						break;
					end;
				end;
			end;
			assert(topscore);
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
			local getscore = GetEvaScore(maxsteps,pss,Player);
			if getscore ~= 0 and getscore >= topscore then
				self:play();
			end;
		end;
	end;
};
	
return t