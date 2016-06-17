local t = Def.ActorFrame{};
	
-- Battle
if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
	-- Battle result
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(bob;effectmagnitude,0,2,0;effectperiod,0.5;);
		OnCommand=function(self)
			if THEME:GetCurLanguage() == "ja" then
				self:y(SCREEN_CENTER_Y+50);
			else
				if GAMESTATE:IsEventMode() then
					if GetUserPref("FirstReMIX_CalorieDisplay") == "on" then
						self:y(SCREEN_CENTER_Y+25);
					else
						self:y(SCREEN_CENTER_Y+50);
					end;
				else
					self:y(SCREEN_CENTER_Y+50);
				end;
			end;
		end;
		-- P1
		Def.Sprite {
			InitCommand=function(self)
				self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-240+3));
				if GAMESTATE:IsWinner(PLAYER_1) then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Win"));
				elseif GAMESTATE:IsDraw() then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/draw"));
				else
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Lose"));
				end;
			end;
			OnCommand=cmd(zoom,0;sleep,1.45;bounceend,0.25;zoom,0.8);
			OffCommand=cmd(zoomy,0.8;bouncebegin,0.25;zoom,0);
		};
		-- P2
		Def.Sprite {
			InitCommand=function(self)
				self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+240-3));
				if GAMESTATE:IsWinner(PLAYER_2) then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Win"));
				elseif GAMESTATE:IsDraw() then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/draw"));
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
	
	-- Star
	local P1Win = getenv("RaveWinP1");
	local P1WinSave;
	if GAMESTATE:IsWinner(PLAYER_1) then
		P1WinSave = P1Win + 1;
	else
		P1WinSave = P1Win + 0;
	end;
	local P2Win = getenv("RaveWinP2");
	local P2WinSave;
	if GAMESTATE:IsWinner(PLAYER_2) then
		P2WinSave = P2Win + 1;
	else
		P2WinSave = P2Win + 0;
	end;
	local SongsPerPlay = PREFSMAN:GetPreference("SongsPerPlay");
	setenv("RaveWinP1",P1WinSave)
	setenv("RaveWinP2",P2WinSave);
	-- P1 Star
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X-236+9,SCREEN_CENTER_X-236);y,SCREEN_CENTER_Y+152);
		OnCommand=cmd(zoomy,0;sleep,1.45;bounceend,0.25;zoomy,1);
		OffCommand=cmd(zoom,0);
		-- P1 Star Gray
		LoadActor(THEME:GetPathB("ScreenEvaluation","overlay/Rave5Star_Gray")) .. {
			InitCommand=function(self)
				if GAMESTATE:IsEventMode() then
					if P1WinSave > 5 then
						self:visible(false);
					end;
				else
					if P1WinSave > 5 then
						self:visible(false);
					else
						self:cropright(1-0.2*SongsPerPlay);
					end;
				--	local xplus = 72-18*(SongsPerPlay-1)
					local xplus = 0;
					if SongsPerPlay == 4 then
						xplus = 18
					elseif SongsPerPlay == 3 then
						xplus = 36
					elseif SongsPerPlay == 2 then
						xplus = 54
					elseif SongsPerPlay == 1 then
						xplus = 72
					end;
					self:x(xplus);
				end;
			end;
		};
		-- P1 Star Yellow
		LoadActor(THEME:GetPathB("ScreenEvaluation","overlay/Rave5Star_Yellow")) .. {
			InitCommand=function(self)
				if GAMESTATE:IsEventMode() then
					if P1WinSave <= 5 then
						self:cropright(1-0.2*P1WinSave);
					else
						self:cropright(0.8);
					end;
					local xplus = 0;
					if P1WinSave > 999 then
						xplus = 45-16;
					elseif P1WinSave > 99 then
						xplus = 45-8;
					elseif P1WinSave > 5 then
						xplus = 45
					end;
					self:x(xplus);
				else
					if P1WinSave <= 5 then
						self:cropright(1-0.2*P1WinSave);
					else
						self:cropright(0.8);
					end;
					local xplus = 0;
					if SongsPerPlay == 4 then
						xplus = 18
					elseif SongsPerPlay == 3 then
						xplus = 36
					elseif SongsPerPlay == 2 then
						xplus = 54
					elseif SongsPerPlay == 1 then
						xplus = 72
					end;
					self:x(xplus);
				end;
			end;
		};
		-- P1 x
		LoadFont("common normal")..{
			InitCommand=function(self)
				if not GAMESTATE:IsEventMode() then return self:visible(false) end;
				local xplus = 0;
				if P1WinSave < 6 then
					self:visible(false);
				elseif P1WinSave > 999 then
					xplus = -16;
				elseif P1WinSave > 99 then
					xplus = -8;
				end;
				self:zoom(0.6);
				self:strokecolor(color("#000000"));
				self:settext("x");
				self:x(xplus);
			end;
		};
		-- P1 Number 
		LoadFont("_RussellSquare 24px")..{
			InitCommand=function(self)
				if not GAMESTATE:IsEventMode() then return self:visible(false) end;
				local xplus = 0;
				if P1WinSave < 6 then
					self:visible(false);
				elseif P1WinSave > 999 then
					xplus = -16;
				elseif P1WinSave > 99 then
					xplus = -8;
				end;
				self:horizalign(left);
				self:zoom(0.6);
				self:strokecolor(color("#000000"));
				self:settextf("%2i",P1WinSave);
				self:x(16 + xplus);
				self:y(-1);
			end;
		};
	};
	-- P2 Star
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X+236-9,SCREEN_CENTER_X+236);y,SCREEN_CENTER_Y+152);
		OnCommand=cmd(zoomy,0;sleep,1.45;bounceend,0.25;zoomy,1);
		OffCommand=cmd(zoom,0);
		-- P2 Star Gray
		LoadActor(THEME:GetPathB("ScreenEvaluation","overlay/Rave5Star_Gray")) .. {
			InitCommand=function(self)
				if GAMESTATE:IsEventMode() then
					if P2WinSave > 5 then
						self:visible(false);
					end;
				else
					if P2WinSave > 5 then
						self:visible(false);
					else
						self:cropright(1-0.2*SongsPerPlay);
					end;
					local xplus = 0;
					if SongsPerPlay == 4 then
						xplus = 18
					elseif SongsPerPlay == 3 then
						xplus = 36
					elseif SongsPerPlay == 2 then
						xplus = 54
					elseif SongsPerPlay == 1 then
						xplus = 72
					end;
					self:x(xplus);
				end;
			end;
		};
		-- P2 Star Yellow
		LoadActor(THEME:GetPathB("ScreenEvaluation","overlay/Rave5Star_Yellow")) .. {
			InitCommand=function(self)
				if GAMESTATE:IsEventMode() then
					if P2WinSave <= 5 then
						self:cropright(1-0.2*P2WinSave);
					else
						self:cropright(0.8);
					end;
					local xplus = 0;
					if P2WinSave > 999 then
						xplus = -99-16;
					elseif P2WinSave > 99 then
						xplus = -99-8;
					elseif P2WinSave > 5 then
						xplus = -99
					end;
					self:x(xplus);
				else
					if P2WinSave <= 5 then
						self:cropright(1-0.2*P2WinSave);
					else
						self:cropright(0.8);
					end;
					local xplus = 0;
					if SongsPerPlay == 4 then
						xplus = 18
					elseif SongsPerPlay == 3 then
						xplus = 36
					elseif SongsPerPlay == 2 then
						xplus = 54
					elseif SongsPerPlay == 1 then
						xplus = 72
					end;
					self:x(xplus);
				end;
			end;
		};
		-- P2 x
		LoadFont("common normal")..{
			InitCommand=function(self)
				if not GAMESTATE:IsEventMode() then return self:visible(false) end;
				local xplus = 0;
				if P2WinSave < 6 then
					self:visible(false);
				elseif P2WinSave > 999 then
					xplus = -16;
				elseif P2WinSave > 99 then
					xplus = -8;
				end;
				self:zoom(0.6);
				self:strokecolor(color("#000000"));
				self:settext("x");
				self:x(xplus);
			end;
		};
		-- P2 Number 
		LoadFont("_RussellSquare 24px")..{
			InitCommand=function(self)
				if not GAMESTATE:IsEventMode() then return self:visible(false) end;
				local xplus = 0;
				if P2WinSave < 6 then
					self:visible(false);
				elseif P2WinSave > 999 then
					xplus = -16;
				elseif P2WinSave > 99 then
					xplus = -8;
				end;
				self:horizalign(left);
				self:zoom(0.6);
				self:strokecolor(color("#000000"));
				self:settextf("%2i",P2WinSave);
				self:x(16 + xplus);
				self:y(-1);
			end;
		};
	};
	
	-- Rave Life Test
	local pss_1p = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
	local pss_2p = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
	local RaveScore = GetRaveScore(pss_1p,pss_2p);
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(y,SCREEN_CENTER_Y+190);
		OnCommand=cmd(zoomy,0;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
		-- Rave Life Back
		Def.Quad{
			InitCommand=cmd(x,SCREEN_CENTER_X;diffusetopedge,color("#707171");diffusebottomedge,color("#404040"));
			OnCommand=function(self)
				if GetScreenAspectRatio() > 1.7 then
					self:zoomto(626,12);
				else
					self:zoomto(588,12);
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
				if GAMESTATE:IsDraw() then
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
		-- Rave 1P Life
		LoadActor(THEME:GetPathG("CombinedLifeMeterTug","stream p1/CombinedLifeMeterTug stream p1")) .. {
			InitCommand=cmd(horizalign,left;x,WideScale(SCREEN_CENTER_X-294,SCREEN_CENTER_X-313);texcoordvelocity,0.20,0;zoomx,WideScale(1.15,1.22265));
			OnCommand=function(self)
				self:cropright(1);
				self:sleep(0.25);
				self:linear(1.2);
				if GAMESTATE:IsDraw() then
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
		LoadActor("ScreenEvaluation_RaveTriangle") .. {
			InitCommand=cmd(y,-20;bounce;effectmagnitude,0,3,0;effectperiod,0.25;diffusealpha,0;sleep,1.45;diffusealpha,1);
			OnCommand=function(self)
				if GAMESTATE:IsDraw() then
					self:x(SCREEN_CENTER_X);
				elseif RaveScore > 100 then
					self:x(WideScale(SCREEN_CENTER_X+294,SCREEN_CENTER_X+313));
				elseif -100 < RaveScore and RaveScore < 100 then
					self:x(SCREEN_CENTER_X-WideScale(294,313)+((0.5+(RaveScore*0.005))*WideScale(588,626)));
				else
					self:x(WideScale(SCREEN_CENTER_X-294,SCREEN_CENTER_X-313));
				end;
			end;
			OffCommand=cmd(sleep,0.25;diffusealpha,0);
		};
	};
	
end;

-- Option icon
--[[
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(draworder,100;y,SCREEN_CENTER_Y+197);
	-- 1P
	LoadActor(THEME:GetPathB("","optionicon_P1")) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,WideScale(1,1.33);x,SCREEN_CENTER_X-160);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	--	Condition=GAMESTATE:IsSideJoined(PLAYER_1); 
	};
	-- 2P
	LoadActor(THEME:GetPathB("","optionicon_P2")) .. {
		InitCommand=cmd(player,PLAYER_2;zoomx,WideScale(1,1.33);x,SCREEN_CENTER_X+160);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	--	Condition=GAMESTATE:IsSideJoined(PLAYER_2); 
	};
};
--]]

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
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
			local grade = pss:GetGrade();
			if grade ~= "Grade_Tier08" then
				self:diffuseshift();
				if pss:FullComboOfScore('TapNoteScore_W1') then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_MarvelousFullCombo"));
					self:zoomx(WideScale(0.7,1));
					self:effectcolor1(color("#fefed0"));
				elseif pss:FullComboOfScore('TapNoteScore_W2') then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_PerfectFullCombo"));
					self:zoomx(WideScale(0.8,1));
					self:effectcolor1(color("#f8fd6d"));
				elseif pss:FullComboOfScore('TapNoteScore_W3') then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_FullCombo"));
					self:zoomx(WideScale(0.88,1));
					self:effectcolor1(color("#01e603"));
				elseif pss:FullComboOfScore('TapNoteScore_W4') then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/FullCombo_Text_FullCombo"));
					self:effectcolor1(color("#10e0f1"));
				else
					return self:visible(false);
				end;
			else
				return self:visible(false);
			end;
			self:effectcolor2(1,0,0,1);
			self:effectperiod(0.25);
			self:draworder(106);
		end;
	};
end

-- スコアが0の時は音が鳴らない
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor(THEME:GetPathS("", "_Score"))..{
		OnCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then return end;
			local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetScore()
			if score ~= 0 then
				self:play();
			end;
		end;
	};
end

return t