local Player = ...
assert(Player,"PersonalRecord needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local record = stats:GetPersonalHighScoreIndex()
local hasPersonalRecord = record ~= -1
local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player):GetScore()
local t = Def.ActorFrame{};
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

--[[
t[#t+1] = LoadFont("_russellsquare Bold 24px")..{
	InitCommand=cmd(zoom,3);
	BeginCommand=function(self)
		if not PROFILEMAN:IsPersistentProfile(Player) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or Var "LoadingScreen" == "ScreenEvaluationSummary" or Var "LoadingScreen" == "ScreenEvaluationSummary2" then return end;
		if GAMESTATE:IsCourseMode() then
			if score ~= 0 and record == 0 then
				self:visible(true);
			else
				self:visible(false);
			end;
		else
			local profile = PROFILEMAN:GetProfile(Player);
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(Player):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			local radar = steps:GetRadarValues(Player);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);

			local scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local bestscore=0;
			if scores[1] then
				-- Load BestScore
				for i = 1, #scores do
					if scores[i] then
						local bestscore2 = GetNormalScore(maxsteps,scores[i],Player);
						if bestscore2 > bestscore then
							bestscore = bestscore2;
						end;
					else
						break;
					end;
				end;
			end;
			--　Change Score
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
			local getscore = GetEvaScore(maxsteps,pss,Player);
			-- Comparison
			self:settext(bestscore);
		end;
	end;
	OffCommand=cmd(linear,0.25;zoomy,0);
};
--]]

t[#t+1] = LoadFont("_russellsquare Bold 24px")..{
	Text="It's a New Record!";
	InitCommand=cmd(visible,false;zoomx,0.663;zoomy,0;sleep,2.3;linear,0.25;zoomy,0.527;diffuse,color("#ffd802");diffusetopedge,color("#ffffff");strokecolor,color("#000000");skewx,-0.2;pulse;effectperiod,0.5;effectmagnitude,1,1.025,0);
	BeginCommand=function(self)
		if not PROFILEMAN:IsPersistentProfile(Player) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or Var "LoadingScreen" == "ScreenEvaluationSummary" or Var "LoadingScreen" == "ScreenEvaluationSummary2" then return end;
		if GAMESTATE:IsCourseMode() then
			if score ~= 0 and record == 0 then
				self:visible(true);
			else
				self:visible(false);
			end;
		else
			local profile = PROFILEMAN:GetProfile(Player);
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(Player):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			local radar = steps:GetRadarValues(Player);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
			local scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local bestscore=0;
			if scores[1] then
				-- Load BestScore
				for i = 1, #scores do
					if scores[i] then
						local bestscore2 = GetNormalScore(maxsteps,scores[i],Player);
						if bestscore2 > bestscore then
							bestscore = bestscore2;
						end;
					else
						break;
					end;
				end;
			end;
			--　Change Score
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
			local getscore = GetEvaScore(maxsteps,pss,Player);
			-- Comparison
			if getscore ~= 0 and getscore >= bestscore then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	end;
	OffCommand=cmd(linear,0.25;zoomy,0);
};

t[#t+1] = LoadActor(THEME:GetPathS("", "NewRecord"))..{
	BeginCommand=function(self)
		if not PROFILEMAN:IsPersistentProfile(Player) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or Var "LoadingScreen" == "ScreenEvaluationSummary" or Var "LoadingScreen" == "ScreenEvaluationSummary2" then return end;
		if GAMESTATE:IsCourseMode() then
			if score ~= 0 and record == 0 then
				self:play();
			end;
		else
			local profile = PROFILEMAN:GetProfile(Player);
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(Player):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			local radar = steps:GetRadarValues(Player);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
			local scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local bestscore=0;
			if scores[1] then
				for i = 1, #scores do
					if scores[i] then
						local bestscore2 = GetNormalScore(maxsteps,scores[i],Player);
						if bestscore2 > bestscore then
							bestscore = bestscore2;
						end;
					else
						break;
					end;
				end;
			end;
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
			local getscore = GetEvaScore(maxsteps,pss,Player);
			if getscore ~= 0 and getscore >= bestscore then
				self:play();
			end;
		end;
	end;
};

return t