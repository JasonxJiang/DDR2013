-- Base from CyberiaStyle 7 by gl_yukt

local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local mStages = STATSMAN:GetStagesPlayed();
local i = 0;

local t = Def.ActorFrame {};

--[[
-- Banner frame
t[#t+1] = LoadActor(THEME:GetPathB("ScreenEvaluation","underlay/Banner_Frame")) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-105);
	OnCommand = cmd(zoom,0;linear,0.25;zoom,1);
	OffCommand=cmd(linear,0.25;diffusealpha,0);
}; 
--]]

-- Banners
for i = 1, mStages do
	local ssStats = STATSMAN:GetPlayedStageStats( i );
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-105+4);
		BeginCommand=function(self)
			if mStages == 2 then
				self:addx(-76.5 + ((mStages - i) * 153));
			elseif mStages == 3 then
				self:addx(-114.5 + ((mStages - i) * 114.5));
			elseif mStages == 4 then
				self:addx(-137.4 + ((mStages - i) * 91.6));
			elseif mStages == 5 then
				self:addx(-150 + ((mStages - i) * 75));
			--	self:addx(-152.6 + ((mStages - i) * 76.5));
			elseif mStages == 6 then
				self:addx(-150 + ((mStages - i) * 60));
			elseif mStages == 7 then
				self:addx(-150 + ((mStages - i) * 50));
			else
				self:addx(0);
			end;
		end;
		-- banner
		Def.Sprite {
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				self:Load(GetJacketBanner(sssong))
				self:scale_to_clip_banner();
			end;
			OnCommand = cmd(zoom,0.35;diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
			OffCommand=cmd(linear,0.25;diffusealpha,0);					
		};
	};
end;

-- All Score
if not GAMESTATE:IsCourseMode() and (Var "LoadingScreen") == "ScreenEvaluationSummary2" then
	local as = {0,0};
	for pn in ivalues(PlayerNumber) do
		if GAMESTATE:IsPlayerEnabled(pn) then
			t[#t+1] = Def.RollingNumbers {
				File=THEME:GetPathF("ScoreDisplayNormal","Text");
				InitCommand=function(self)
					(cmd(Load,"RollingNumbersEvaluationSleep";y,SCREEN_CENTER_Y+147;diffuse,color("#fff90a");zoomx,WideScale(1,1.25);visible,false))(self);
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-234));
					else
						self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+234));
					end;
					self:targetnumber(0);
					self:queuecommand("Sleep");
				end;
				SleepCommand=function(self)
					self:sleep(0.3);
					self:queuecommand("Roll");
				end;
				RollCommand=function(self)
					local p=((pn == PLAYER_1) and 1 or 2);
					for i = 1, mStages do
						local sStats = STATSMAN:GetPlayedStageStats(i);
						local pss = sStats:GetPlayerStageStats(pn)
						local song = sStats:GetPlayedSongs()[1];
						local diff = pss:GetPlayedSteps()[1]:GetDifficulty();
						local steps = song:GetOneSteps( st, diff );
						local radar = steps:GetRadarValues(pn);
						local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
						as[p] = as[p] + GetEvaScore(maxsteps,pss,pn);
					end;
					self:visible(true);
					self:targetnumber(as[p]);
				end;
				OffCommand=cmd(diffusealpha,0);
			};
		end;
	end;
end;



-- FullComboColor base from Default Extended by A.C
local function GetFullComboEffectColor(pss)
	local r;
		if pss:FullComboOfScore('TapNoteScore_W1') then
			r=color("#fefed0");
		elseif pss:FullComboOfScore('TapNoteScore_W2') then
			r=color("#f8fd6d");
		elseif pss:FullComboOfScore('TapNoteScore_W3') then
			r=color("#01e603");
		elseif pss:FullComboOfScore('TapNoteScore_W4') then
			r=color("#10e0f1");
		end;
	return r;
end;

-- FullCombo Text
for pn in ivalues(PlayerNumber) do
	local MetricsName = "StageAward" .. PlayerNumberToString(pn);
	t[#t+1] = Def.Sprite{
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
		--	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
			local pss = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn);
			local grade = pss:GetGrade();
			if grade ~= "Grade_Tier08" then
				if pss:FullComboOfScore('TapNoteScore_W1') == true then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_MarvelousFullCombo"));
					self:zoomx(WideScale(0.7,1));
					self:visible(true);
				elseif pss:FullComboOfScore('TapNoteScore_W2') == true then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_PerfectFullCombo"));
					self:zoomx(WideScale(0.8,1));
					self:visible(true);
				elseif pss:FullComboOfScore('TapNoteScore_W3') == true then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_FullCombo"));
					self:zoomx(WideScale(0.88,1));
					self:visible(true);
				elseif pss:FullComboOfScore('TapNoteScore_W4') == true then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_FullCombo"));
					self:visible(true);
				else
					self:visible(false);
				end;
			else
				return self:visible(false);
			end;
			self:diffuseshift();
			self:effectcolor1(GetFullComboEffectColor(pss)); 
			self:effectcolor2(1,0,0,1);
			self:effectperiod(0.25);
			self:draworder(106);
		end;
	};
end

-- スコアが0の時は音が鳴らない
for pn in ivalues(PlayerNumber) do
	t[#t+1] = LoadActor(THEME:GetPathS("", "_Score"))..{
		OnCommand=function(self)
			local score = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn):GetScore()
			if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
				return
			end;
			if score ~= 0 then
				self:play();
			end;
		end;
	};
end

-- Rave Life
if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
	local pss_1p = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1);
	local pss_2p = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_2);
	local mStages = STATSMAN:GetStagesPlayed();
	local RaveScore = GetRaveScore(pss_1p,pss_2p)/mStages;
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(y,SCREEN_CENTER_Y+175);
		OnCommand=cmd(zoomy,0;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
		-- Rave Life Back
		Def.Quad{
			InitCommand=cmd(x,SCREEN_CENTER_X;zoomto,626,12;diffusetopedge,color("#707171");diffusebottomedge,color("#404040"));
		};
		-- Rave 1P Life
		LoadActor(THEME:GetPathG("CombinedLifeMeterTug","stream p1/CombinedLifeMeterTug stream p1")) .. {
			InitCommand=cmd(horizalign,left;x,WideScale(SCREEN_CENTER_X-294,SCREEN_CENTER_X-313);texcoordvelocity,0.20,0;zoomx,WideScale(1.15,1.22265));
			OnCommand=function(self)
				self:cropright(1);
				self:sleep(0.25);
				self:linear(1.2);
				if RaveScore == 0 then
					self:cropright(0.5);
				elseif RaveScore > 100 then
					self:cropright(0);
				elseif -100 < RaveScore and RaveScore < 100 then
					self:cropright(0.5-(RaveScore*0.005));
				else
					self:cropright(1);
				end;
			end;
		};
		-- Rave 2P Life
		LoadActor(THEME:GetPathG("CombinedLifeMeterTug","stream p2/CombinedLifeMeterTug stream p2")) .. {
			InitCommand=cmd(horizalign,right;x,WideScale(SCREEN_CENTER_X+294,SCREEN_CENTER_X+313);texcoordvelocity,-0.20,0;zoomx,WideScale(1.15,1.22265));
			OnCommand=function(self)
				self:cropleft(1);
				self:sleep(0.25);
				self:linear(1.2);
				if RaveScore == 0 then
					self:cropleft(0.5);
				elseif RaveScore > 100 then
					self:cropleft(1);
				elseif -100 < RaveScore and RaveScore < 100 then
					self:cropleft(0.5+(RaveScore*0.005));
				else
					self:cropleft(0);
				end;
			end;
		};
		-- Rave Life frame
		LoadActor(THEME:GetPathB('','_frame 3x1'), 'Evaluation_Life_Frame', WideScale(588,626)) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X);
		};
		-- Rave Life Sound
		LoadActor(THEME:GetPathS("ScreenEvaluation", "RaveLife"))..{
			OnCommand=function(self)
				self:play();
			end;
		};
		-- Rave Life Triangle
		LoadActor(THEME:GetPathB("ScreenEvaluation","overlay/ScreenEvaluation_RaveTriangle")) .. {
			InitCommand=cmd(y,-20;bounce;effectmagnitude,0,3,0;effectperiod,0.25;diffusealpha,0;sleep,1.45;diffusealpha,1);
			OnCommand=function(self)
				if RaveScore == 0 then
					self:x(SCREEN_CENTER_X);
				elseif RaveScore > 100 then
					self:x(SCREEN_CENTER_X+313);
				elseif -100 < RaveScore and RaveScore < 100 then
					self:x(SCREEN_CENTER_X-313+((0.5+(RaveScore*0.005))*626));
				else
					self:x(SCREEN_CENTER_X-313);
				end;
			end;
		};
	};
	-- Battle result
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(bob;effectmagnitude,0,2,0;effectperiod,0.5;y,SCREEN_CENTER_Y+50);
		-- 1P
		Def.Sprite {
			InitCommand=function(self)
				self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-240));
				if RaveScore == 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/draw"));
				elseif RaveScore > 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Win"));
				else
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Lose"));
				end;
			end;
			OnCommand=cmd(zoom,0;sleep,1.45;bounceend,0.25;zoom,0.8);
			OffCommand=cmd(zoomy,0.8;bouncebegin,0.25;zoom,0);
		};
		-- 2P
		Def.Sprite {
			InitCommand=function(self)
				self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+240));
				if RaveScore == 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/draw"));
				elseif RaveScore < 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Win"));
				else
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Lose"));
				end;
			end;
			OnCommand=cmd(zoom,0;sleep,1.45;bounceend,0.25;zoom,0.8);
			OffCommand=cmd(zoomy,0.8;bouncebegin,0.25;zoom,0);
		};
		-- Rave Result Sound
		LoadActor(THEME:GetPathS("ScreenEvaluation", "RaveResult"))..{
			OnCommand=function(self)
				self:play();
			end;
		};
	};
end

return t