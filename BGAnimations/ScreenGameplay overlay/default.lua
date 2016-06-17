local t = Def.ActorFrame{};
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local style = GAMESTATE:GetCurrentStyle():GetStyleType()
local mpn = GAMESTATE:GetMasterPlayerNumber();

local ts = {0,0};
local ts_all = {0,0};
local w1 = {0,0};
local w2 = {0,0};
local w3 = {0,0};
local w4 = {0,0};
local hd = {0,0};
local ms = 0;

local Cutin = {0,0};
local CutinHalf = 0;
local Cutin90 = 0;

setenv("CutInC_P1",false);
setenv("CutInC_P2",false);
setenv("EndlessMaxSteps",0);

-- Option icon
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd();
	-- 1P
	LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X-221,SCREEN_CENTER_X-296));
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-276);
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' and CalorieDisplay(PLAYER_1) == "on" then
				self:y(SCREEN_CENTER_Y+170-22);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
	};
	-- 2P
	LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
		InitCommand=cmd(player,PLAYER_2;zoomx,WideScale(1,1.34);x,WideScale(SCREEN_CENTER_X+239,SCREEN_CENTER_X+320));
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
				self:y(SCREEN_CENTER_Y-276);
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' and CalorieDisplay(PLAYER_2) == "on" then
				self:y(SCREEN_CENTER_Y+170-22);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
	};	
};

--[[
-- Time Bar test
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) and GAMESTATE:IsSideJoined(pn) then
		t[#t+1] = Def.Quad {
			InitCommand=cmd(y,SCREEN_CENTER_Y-211+4;diffuse,color("#fff90a");vertalign,bottom);
			OnCommand=function(self)
				local length = 0;
				local sleep = 2.6;
				if GAMESTATE:IsCourseMode() then
					local trail = GAMESTATE:GetCurrentTrail(mpn);
					if trail then
						length = TrailUtil.GetTotalSeconds(trail);
					else
						length = 0;
					end;
				else
					local song = GAMESTATE:GetCurrentSong();
					length = song:MusicLengthSeconds();
				end;
				if pn == PLAYER_1 then
					self:x(SCREEN_LEFT+24);
					self:horizalign(left);
				else
					self:x(SCREEN_RIGHT-24);
					self:horizalign(right);
				end;
				self:zoomto(0,3);
				self:sleep(sleep);
				if length <= sleep then
					self:linear(sleep - length);
				else
					self:linear(length - sleep);
				end;
				self:zoomto(WideScale(234,341),WideScale(3,3));
			end;
		}
	end;
end;
--]]
--[[
-- Player circle
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,SCREEN_CENTER_Y-218);
	-- 1P circle
	LoadActor("1P.lua")..{
		InitCommand = cmd(player,PLAYER_1;effectclock,"beat";horizalign,left;x,SCREEN_LEFT);
	--	Condition=GAMESTATE:IsSideJoined(PLAYER_1);
	};
	-- 2P circle
	LoadActor("2P.lua")..{
		InitCommand = cmd(player,PLAYER_2;effectclock,"beat";horizalign,right;x,SCREEN_RIGHT);
	--	Condition=GAMESTATE:IsSideJoined(PLAYER_2);
	};
	-- 1P CPU circle
	LoadActor("1P_CPU.lua")..{
		InitCommand = cmd(effectclock,"beat";horizalign,left;x,SCREEN_LEFT);
		Condition=not GAMESTATE:IsSideJoined(PLAYER_1) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
	};
	-- 2P CPU circle
	LoadActor("2P_CPU.lua")..{
		InitCommand = cmd(effectclock,"beat";horizalign,right;x,SCREEN_RIGHT);
		Condition=not GAMESTATE:IsSideJoined(PLAYER_2) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
	};
};]]--

-- Danger
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(draworder,45;diffusealpha,0;bounce;effectmagnitude,0,7,0;effectperiod,0.5);
	ShowDangerAllMessageCommand=cmd(stoptweening;accelerate,0.3;diffusealpha,1);
	HideDangerAllMessageCommand=cmd(stoptweening;accelerate,0.3;diffusealpha,0);
	-- Danger 1P
	LoadActor("danger_1st") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-(SCREEN_WIDTH/3.6)+33;y,SCREEN_CENTER_Y-218;diffuseblink;effectperiod,0.5;rotationz,-6;);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
	};
	-- Danger 2P
	LoadActor("danger_1st") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+(SCREEN_WIDTH/3.6)-33;y,SCREEN_CENTER_Y-218;diffuseblink;effectperiod,0.5;rotationz,-6;);
		Condition=GAMESTATE:IsSideJoined(PLAYER_2) or GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
	};
};

if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
	--　Battle stream frame
	t[#t+1] = LoadActor("ScoreDisplayRave_frame") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-160);
	};
	-- Battle level text pic
	for pn in ivalues(PlayerNumber) do
		t[#t+1] = LoadActor("Level") .. {
			InitCommand = function(self)
				if pn == PLAYER_1 then
					self:x(WideScale(SCREEN_CENTER_X-236,SCREEN_CENTER_X-313));
				else
					self:x(WideScale(SCREEN_CENTER_X+217,SCREEN_CENTER_X+289));
				end
				(cmd(y,SCREEN_CENTER_Y+205;zoomx,WideScale(1,1.25);diffuseshift;effectcolor1,color("#ff0000");effectcolor2,color("#990303");effectperiod,0.3333))(self)
			end;
		};
	end;
end;

-- Alive Time Script
if GAMESTATE:IsCourseMode() and GAMESTATE:GetCoinMode() == "CoinMode_Home" then
	t[#t+1] = LoadActor("AliveTime")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+172);
	};
end;

------------------------------------------------------------------------------
t[#t+1] = LoadActor("CalorieP1") .. {
		InitCommand=cmd(player,PLAYER_1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') and CalorieDisplay(PLAYER_1) == "on" then
			    self:x(SCREEN_CENTER_X-370);
				self:y(SCREEN_CENTER_Y-298);
				self:zoomx(0.7);
			elseif CalorieDisplay(PLAYER_1) == "on" then
			    self:x(SCREEN_CENTER_X-370);
				self:y(SCREEN_CENTER_Y+275);
				self:zoomx(0.7);
	--			self:y(SCREEN_CENTER_Y+170-22);
		--	else
		--        self:diffusealpha(0);
			--	self:y(SCREEN_CENTER_Y+275);
			end;
		end;
	};
---------------------------------------------------------------------------------	
	-- 2P
t[#t+1] =LoadActor("CalorieP2") .. {
		InitCommand=cmd(player,PLAYER_2);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') and CalorieDisplay(PLAYER_2) == "on" then
				self:x(SCREEN_CENTER_X+370);
				self:y(SCREEN_CENTER_Y-298);
				self:zoomx(0.7);
			elseif CalorieDisplay(PLAYER_2) == "on"then
                self:x(SCREEN_CENTER_X+370);
				self:y(SCREEN_CENTER_Y+275);
				self:zoomx(0.7);
--			else
--				self:y(SCREEN_CENTER_Y+275);
			end;
		end;
	};
--[[
------------------------------------------------------------------------------
-------------------------- calorie score position gameplay -------------------
-- Calorie Display P1 Script
--if GAMESTATE:IsHumanPlayer(PLAYER_1) and CalorieDisplay(PLAYER_1) == "on" then
t[#t+1] = LoadActor("CalorieP1")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-370;y,SCREEN_CENTER_Y+275;zoomx,0.7);
	Condition=GAMESTATE:IsHumanPlayer(PLAYER_1) and CalorieDisplay(PLAYER_1) == "on";
	};	
--if GAMESTATE:IsHumanPlayer(PLAYER_1) and CalorieDisplay(PLAYER_1) == "on" and GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'Noreverse') then
t[#t+1] = LoadActor("CalorieP1")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-370;y,SCREEN_CENTER_Y-298;zoomx,0.7);
	Condition=GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') and GAMESTATE:IsHumanPlayer(PLAYER_1) and CalorieDisplay(PLAYER_1) == "on";
};	]]--

--[[
-- Calorie Display P2 Script
if GAMESTATE:IsHumanPlayer(PLAYER_2) and CalorieDisplay(PLAYER_2) == "on" then
	t[#t+1] = LoadActor("CalorieP2")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+370;y,SCREEN_CENTER_Y+275;zoomx,0.7);
	};
end; ]]--

-- New Score
if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	
		local bEXScore = EXScore(pn);
		local bComboGraphic = ComboGraphic(pn);
		local function fontPath()
			if bComboGraphic == '2013' then
				return THEME:GetPathF("_Newsanse","Heavy");
			else
				return THEME:GetPathF("ScoreDisplayNormal","Text");
			end;
		end;
		t[#t+1] = Def.RollingNumbers {
		--	File=THEME:GetPathF("ScoreDisplayNormal","Text");
			File=fontPath();
			InitCommand=function(self)
				
				if bComboGraphic == '2013' then
					self:Load("RollingNumbers2003");
					self:y(SCREEN_CENTER_Y+200);
					self:zoomx(WideScale(1,1.04));
					self:zoomy(0.56);
				else
					self:Load("RollingNumbers");
					self:diffuse(PlayerScoreColor(pn));
					self:y(SCREEN_CENTER_Y+199);
					self:zoomx(WideScale(1,1.25));
				end;
				------------------------ score gameplay position--------
				if pn == PLAYER_1 then
					self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-301.5));
					self:y(SCREEN_CENTER_Y+297);
					self:zoomy(1);
					self:zoomx(1.7);
				else
					self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+300.5));
					self:y(SCREEN_CENTER_Y+297);
					self:zoomy(1);
					self:zoomx(1.7);
				end;
				self:targetnumber(0);
			end;
			JudgmentMessageCommand = function(self, params)
				if params.Player ~= pn then return end
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					local score;
					if bEXScore == "On" then
						score = ChangeEXScore(params);
					else
						local step = GAMESTATE:GetCurrentSteps(params.Player);
						score = ChangeSN2Score(params,step);
					end;
				--	local score = ChangeEXScore(params,step);
					self:targetnumber(score);
				end
			end;
		};
	end
end

-- New Course Score test
local function CourseScore_SM5b1(params,bkihonten,csall,bSaveAllNote)
	local pn=params.Player;
	local p=((pn == PLAYER_1) and 1 or 2);
	local pss=STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
	local score = 0;
	local stage;
	if csall % 2 == 0 then
		stage = csall;
	else
		stage = csall+1;
	end
	local level = (-1*stage/2)+2+stage
	local w1=pss:GetTapNoteScores('TapNoteScore_W1');
	local hd=pss:GetHoldNoteScores('HoldNoteScore_Held');
	if params.HoldNoteScore=='HoldNoteScore_Held' then
		score = score + (bkihonten * level);
	elseif params.TapNoteScore=='TapNoteScore_W1' then
		score = score + (bkihonten * level);
	elseif params.TapNoteScore=='TapNoteScore_W2' then
		score = score + (bkihonten * (level-1));
	elseif params.TapNoteScore=='TapNoteScore_W3' then
		score = score + (bkihonten * (level-2));
	end;
	-- もしマーベラスフルコンボだった場合、小数点の関係かギリギリ満点にならないことが多いためこうする
	--　なおコース全体から総ノート数を呼び出すと普段は問題ないが、コースがランダム時にはまともな数値が出ない、なので実際に計測する
	if w1+hd == bSaveAllNote then
		ts[p] = 1000000
	else
		ts[p] = ts[p] + score
	end;
	return ts[p];
end;

-- New Endless Score test
local function EndlessScore_SM5b1(player,maxsteps)
	local p = ((player == PLAYER_1) and 1 or 2);
	ts[p] = math.round((w1[p] + w2[p] + w3[p]/2 + hd[p]) *100000/maxsteps-(w2[p] + w3[p]))*10;
	return ts[p];
end;

-- New CourseScore Test
if GAMESTATE:IsCourseMode() then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local p=((pn == PLAYER_1) and 1 or 2);
		local bkihonten = kihonten();
		local bSaveAllNote = getenv("SaveAllNote");
		local bEXScore = EXScore(pn);
		
		if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
			-- Score Frame
			local bComboGraphic = ComboGraphic(pn);
			local function ScoreFramePath()
				if bComboGraphic == '2013' then
					return THEME:GetPathB('','_frame 3x1'),'ScoreFrame_2013',WideScale(186,248);
				else
					return THEME:GetPathB('','_frame 3x1'),'ScoreFrame_default',WideScale(186,250);
				end;
			end;
		--	t[#t+1] = LoadActor(THEME:GetPathB('','_frame 3x1'),'ScoreFrame_default',WideScale(186,250))..{
			t[#t+1] = LoadActor(ScoreFramePath())..{
				InitCommand=cmd(player,pn;draworder,46);
				OnCommand=function(self)
					if pn == PLAYER_1 then
						if bComboGraphic == '2013' then
							self:x(WideScale(SCREEN_CENTER_X-225+1,SCREEN_CENTER_X-301+1));
						else
							self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-301));
						end;
					else
						if bComboGraphic == '2013' then
							self:x(WideScale(SCREEN_CENTER_X+225-1,SCREEN_CENTER_X+301-1));
						else
							self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+301));
						end;
					end;
					if CalorieDisplay(pn) == "on" then
						self:y(SCREEN_CENTER_Y+182);
					else
						self:y(SCREEN_CENTER_Y+226);
					end;
				end;
			};
			-- Endless Normal Score
			t[#t+1] = Def.RollingNumbers {
				File=THEME:GetPathF("ScoreDisplayNormal","Text");
				InitCommand=function(self)
					(cmd(Load,"RollingNumbers";diffuse,PlayerScoreColor(pn);zoomx,WideScale(1,1.25);draworder,50))(self);
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-301.5));
					else
						self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+300.5));
					end;
					if CalorieDisplay(pn) == "on" then
						self:y(SCREEN_CENTER_Y+199-22);
					else
						self:y(SCREEN_CENTER_Y+199);
					end;
					self:targetnumber(0);
				end;
				JudgmentMessageCommand = function(self, params)
					if params.Player ~= pn then return end
					if params.TapNoteScore and
					   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
					   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
					   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
					   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
					   params.TapNoteScore ~= 'TapNoteScore_None'
					then
						if params.HoldNoteScore == 'HoldNoteScore_Held' then
							hd[p]=hd[p]+1;
						elseif params.TapNoteScore == 'TapNoteScore_W1' then
							w1[p]=w1[p]+1;
						elseif params.TapNoteScore == 'TapNoteScore_W2' then
							w2[p]=w2[p]+1;
						elseif params.TapNoteScore == 'TapNoteScore_W3' then
							w3[p]=w3[p]+1;
						elseif params.TapNoteScore == 'TapNoteScore_W4' then
							w4[p]=w4[p]+1;
						end;
						local score;
						if bEXScore == "On" then
							local scoremove = EndlessScore_SM5b1(pn,ms);
							score = w1[p]*3 + w2[p]*2 + w3[p]*1 + hd[p]*3;
						else
							score = EndlessScore_SM5b1(pn,ms);
						end;
						self:targetnumber(score);
					end
				end;
				CurrentSongChangedMessageCommand=function(self)
					ts_all[p] = ts_all[p] + ts[p];
					ts[p] = 0;
					w1[p] = 0;
					w2[p] = 0;
					w3[p] = 0;
					w4[p] = 0;
					hd[p] = 0;
					self:targetnumber(0);
					self:queuecommand("Check");
				end;
				CheckCommand=function(self)
					local esong = getenv("EndlessSong");
					local trail = GAMESTATE:GetCurrentTrail(pn)
					local entries = trail:GetTrailEntries()
					local song = entries[esong];
					local diff = song:GetSteps():GetDifficulty()
					local onestep = song:GetSong():GetOneSteps(st,diff)
					local rv = onestep:GetRadarValues(pn);
					local maxsteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
					ms = maxsteps;
					-- For FullCombo
					setenv("EndlessMaxSteps",maxsteps);
				end;
				OffCommand=function(self)
					STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):SetScore(ts_all[p] + ts[p]);
				end;
			};
			-- Endless All Score
			t[#t+1] = Def.RollingNumbers {
				File=THEME:GetPathF("ScoreDisplayNormal","Text");
				InitCommand=function(self)
					(cmd(Load,"RollingNumbersEndless";y,SCREEN_CENTER_Y+199-50-50+100;diffuse,PlayerScoreColor(pn);zoomx,WideScale(1,1.25);maxwidth,WideScale(185,200);draworder,50))(self);
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-301.5));
					else
						self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+300.5));
					end;
					if CalorieDisplay(pn) == "on" then
						self:y(SCREEN_CENTER_Y+199);
					else
						self:y(SCREEN_CENTER_Y+199+22);
					end;
					self:targetnumber(0);
				end;
				JudgmentMessageCommand = function(self, params)
					if params.Player ~= pn then return end
					if params.TapNoteScore and
					   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
					   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
					   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
					   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
					   params.TapNoteScore ~= 'TapNoteScore_None'
					then
						local score;
						if bEXScore == "On" then
							score = ChangeEXScore(params);
							self:targetnumber(score);
						else
							self:queuecommand("Check");
						end;
					end
				end;
				CheckCommand=function(self)
					local score = ts_all[p] + ts[p];
					self:targetnumber(score);
				end;
			};
			-- FullCombo Endless
			t[#t+1] = LoadActor("FullCombo/Endless",pn);
		else
			-- Nonstop and Challenge Score
			t[#t+1] = Def.RollingNumbers {
				File=THEME:GetPathF("ScoreDisplayNormal","Text");
				InitCommand=function(self)
					(cmd(Load,"RollingNumbers";y,SCREEN_CENTER_Y+199;diffuse,PlayerScoreColor(pn);zoomx,WideScale(1,1.25);draworder,50))(self);
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-302));
					else
						self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+302));
					end;
					self:targetnumber(0);
				end;
				JudgmentMessageCommand = function(self, params)
					if params.Player ~= pn then return end
					if params.TapNoteScore and
					   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
					   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
					   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
					   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
					   params.TapNoteScore ~= 'TapNoteScore_None'
					then
						local csall = getenv("CourseStageAll");
						local score;
						if bEXScore == "On" then
							local scoremove = CourseScore_SM5b1(params,bkihonten,csall,bSaveAllNote);
							score = ChangeEXScore(params);
						else
							score = CourseScore_SM5b1(params,bkihonten,csall,bSaveAllNote);
						end;
						self:targetnumber(score);
					end
				end;
				OffCommand=function(self)
					STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):SetScore(ts[p]);
				end;
			};
		end;
	end
end

-- CutIn check
local function CutInCheck(diff,score,p)
	if CutinHalf == Cutin[p] then
		if (diff == "Difficulty_Beginner" or diff == "Difficulty_Easy" or diff == "Difficulty_Edit") and score >= 400000 then
			return true
		elseif diff == "Difficulty_Medium" and score >= 425000 then
			return true
		elseif (diff == "Difficulty_Hard" or diff == "Difficulty_Challenge") and score >= 450000 then
			return true
		else
			return false
		end;
--	elseif Cutin90 == Cutin[p] then
	else
		if (diff == "Difficulty_Beginner" or diff == "Difficulty_Easy" or diff == "Difficulty_Edit") and score >= 720000 then
			return true
		elseif diff == "Difficulty_Medium" and score >= 765000 then
			return true
		elseif (diff == "Difficulty_Hard" or diff == "Difficulty_Challenge") and score >= 810000 then
			return true
		else
			return false
		end;
	end;
end;

-- Save CutIn C
-- 全体的にズレ対策で間にコマンドを挟んである
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	if cutin(pn) then
		local p=((pn == PLAYER_1) and 1 or 2);
		t[#t+1] = Def.Actor {
			InitCommand=cmd(zoom,2;x,SCREEN_CENTER_X+84-100;y,SCREEN_CENTER_Y-50;diffuse,color("#ffffff");strokecolor,color("#000000"));
			CurrentSongChangedMessageCommand = function(self)
				if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
					Cutin[p] = 0;
				end;
				self:queuecommand("Check");
			end;
			CheckCommand=cmd(queuecommand,"Check2");
			Check2Command = function(self)
				local MaxSteps = 0;
				if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
					local esong = getenv("EndlessSong");
					local trail = GAMESTATE:GetCurrentTrail(pn)
					local entries = trail:GetTrailEntries()
					local song = entries[esong];
					local diff = song:GetSteps():GetDifficulty()
					local onestep = song:GetSong():GetOneSteps(st,diff)
					local rv = onestep:GetRadarValues(pn);
					MaxSteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
				elseif GAMESTATE:IsCourseMode() then
					MaxSteps = getenv("SaveAllNote")
				else
					local steps = GAMESTATE:GetCurrentSteps(pn)
					local rv=steps:GetRadarValues(pn);
					MaxSteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
				end;
				CutinHalf = (math.round(MaxSteps*0.5));
				Cutin90 = (math.round(MaxSteps*0.9));
			end;
			JudgmentMessageCommand = function(self, params)
				if params.Player ~= pn then return end
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					Cutin[p]=Cutin[p]+1;
					if CutinHalf == Cutin[p] or Cutin90 == Cutin[p] then
						if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
							self:queuecommand("Endless");
						elseif GAMESTATE:IsCourseMode() then
							local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player);
							-- コースモードでもSN2スコアに変換してグレードA到達点を出す
							local score = ChangeCourseSN2Score(pss);
							local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
							local check = CutInCheck(diff,score,p);
							setenv("CutInC_"..ToEnumShortString(params.Player),check);
						else
							local steps = GAMESTATE:GetCurrentSteps(params.Player)
							local diff = steps:GetDifficulty();
							local score = ChangeSN2Score(params,steps);
							local check = CutInCheck(diff,score,p);
							setenv("CutInC_"..ToEnumShortString(params.Player),check);
						end;
					else
						setenv("CutInC_"..ToEnumShortString(params.Player),false);
					end;
				end
			end;
			EndlessCommand = function(self)
				local score = EndlessScore_SM5b1(pn,ms);
				local steps = GAMESTATE:GetCurrentSteps(pn)
				local diff = steps:GetDifficulty();
				local check = CutInCheck(diff,score,p);
				setenv("CutInC_"..ToEnumShortString(pn),check);
			end;
		};
	end;
end;

--[[
-- Cutin C test
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	if cutin(pn) then
		local p=((pn == PLAYER_1) and 1 or 2);
		t[#t+1] = LoadFont("Common Normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-30;zoom,1;diffuse,color("#ffffff");strokecolor,color("#000000"));
			CheckCommand = cmd(queuecommand,"Check2");
			Check2Command = cmd(queuecommand,"Check3");
			Check3Command = function(self)
				local MaxSteps = 0;
				if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
					local esong = getenv("EndlessSong");
					local trail = GAMESTATE:GetCurrentTrail(pn)
					local entries = trail:GetTrailEntries()
					local song = entries[esong];
					local diff = song:GetSteps():GetDifficulty()
					local onestep = song:GetSong():GetOneSteps(st,diff)
					local rv = onestep:GetRadarValues(pn);
					MaxSteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
				elseif GAMESTATE:IsCourseMode() then
					MaxSteps = getenv("SaveAllNote")
				else
					local song = GAMESTATE:GetCurrentSong();
					local steps = GAMESTATE:GetCurrentSteps(pn)
					local rv=steps:GetRadarValues(pn);
					MaxSteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')
					+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);
				end;
				self:settext("AllStep "..MaxSteps);
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Check");
		};
		t[#t+1] = LoadFont("Common Normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+50;zoom,1;diffuse,color("#ffffff");strokecolor,color("#000000"));
			CheckCommand = cmd(queuecommand,"Check2");
			Check2Command = cmd(queuecommand,"Check3");
			Check3Command = function(self)
				self:settext(CutinHalf.." or "..Cutin90);
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Check");
		};
		t[#t+1] = LoadFont("Common Normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+50+50;zoom,2;diffuse,color("#ffffff");strokecolor,color("#000000"));
			JudgmentMessageCommand = function(self, params)
				if params.Player ~= pn then return end
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					self:queuecommand("Go");
				end
			end;
			GoCommand = function(self)
				if CutinHalf == Cutin[p] then
					self:settext("半分");
				else
					self:settext(Cutin[p]);
				end;
			end;
		};
		t[#t+1] = LoadFont("Common Normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+50+50+50;zoom,2;diffuse,color("#ffffff");strokecolor,color("#000000"));
			JudgmentMessageCommand = function(self, params)
				if params.Player ~= pn then return end
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					if CutinHalf == Cutin[p] then
						self:settext("半分");
					elseif Cutin90 == Cutin[p] then
						self:settext("90%");
					elseif CutinHalf > Cutin[p] then
						self:settext(CutinHalf-Cutin[p]);
					elseif Cutin90 > Cutin[p] then
						self:settext(Cutin90-Cutin[p]);
					else
						self:settext("Cオワリ");
					end;
				end
			end;
		};
		-- test
		t[#t+1] = LoadFont("common normal") .. {
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-100;zoom,1;settext,"0";strokecolor,color("#000000"));
			JudgmentMessageCommand = function(self, params)
				if params.Player ~= pn then return end
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
						self:queuecommand("Endless");
					elseif GAMESTATE:IsCourseMode() then
						self:queuecommand("Course");
					else
						self:settext("");
					end;
				end
			end;
			EndlessCommand = function(self)
				local score = EndlessScore_SM5b1(pn,ms);
				self:settext(score);
			end;
			CourseCommand = function(self)
				local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
				local score = ChangeCourseSN2Score(pss);
				self:settext(score);
			end;
		};
	end;
end;
--]]

-- FullCombo
if GAMESTATE:GetPlayMode() ~= 'PlayMode_Endless' then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		t[#t+1] = LoadActor("FullCombo",pn);
	end;
end;

return t;