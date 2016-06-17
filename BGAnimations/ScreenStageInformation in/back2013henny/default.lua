local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;
--------------------------------------------------------------------------------------------------

return Def.ActorFrame {
	OnCommand=cmd(sleep,0);
	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,0");sleep,0;linear,0.9;diffusealpha,0);
		
	};	
	--- Load Background Doors Song Frame ---
	LoadActor("../StageinBG.png")..{
		InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,1;linear,0.5;diffusealpha,1;sleep,3.5);
	};
---- DOOR OPEN > CLOSE  CLOSE > OPEN
		LoadActor("../2013Door01.png")..{
		InitCommand=cmd(x,0;y,0);
		--OnCommand=cmd(linear,0.25;y,0;sleep,1.80;linear,0.45;y,-720);
	};

		LoadActor("../2013Door02.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+360;);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y;sleep,1.80;linear,0.45;y,SCREEN_CENTER_Y+360);
	};
	--- Closed door song --
	LoadActor("../_door_close")..{
		OnCommand=cmd(play);
	};
	--- DDR2013 LOGO  apparition > disparition ---
    LoadActor("../DDR_logo_Doors.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1;sleep,1.50;linear,0.25;diffusealpha,0);
	};
	--- Flash SONG BANNER
	LoadActor("../flashsongbanner.png")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0);
		OnCommand=cmd(zoom,0.3;sleep,2.5;diffusealpha,0.5;linear,0.45;zoom,5;diffusealpha,0);
	};
	--- SONG BANNER DEZOOM ---
	Def.Quad {
		InitCommand=cmd(Center;scaletoclipped,460,460;diffuse,Color("White");diffusealpha,0);
		OnCommand=cmd(zoom,0.2;sleep,1.90;linear,0.40;diffusealpha,1;diffuse,Color("Black");zoom,1;sleep,3;linear,0.5;diffusealpha,0);
	};
	Def.Sprite {
		InitCommand=cmd(Center;diffusealpha,0;scaletoclipped,458,458);
		BeginCommand=cmd(LoadFromCurrentSongBanner);
		OnCommand=cmd(zoom,5;sleep,1.90;linear,0.25;diffusealpha,0.5;zoom,0.75;linear,0.1;zoom,1;sleep,0.1;linear,0.25;diffusealpha,0;zoom,1.2);
		
	};
	Def.Sprite {		
	InitCommand=cmd(Center;diffusealpha,0;scaletoclipped,458,458);
		BeginCommand=cmd(LoadFromCurrentSongBanner);
		OnCommand=cmd(zoom,5;sleep,1.90;linear,0.25;diffusealpha,1;zoom,0.75;linear,0.1;zoom,1;sleep,4);
	};
	--- STAGE FRAME APPARITION > DISPARITION ---
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;sleep,0.000;sleep,3;diffuse,color("0.2,0.2,0.2,1");zoom,1;addx,-600;linear,0.2;zoomx,1;addx,600;linear,0.1;sleep,0;diffuse,color("0.2,0.2,0.2,1");linear,0.3;zoom,1;);
	};
	
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;sleep,0.000;sleep,3;diffusealpha,1;zoom,1;addx,600;linear,0.2;zoomx,1;addx,-600;linear,0.1;sleep,0;diffuse,1,1,1,1;linear,0.3;zoom,1;);
	};
	
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.000;sleep,3;diffusealpha,0;zoom,1;addx,600;linear,0.2;zoomx,1;addx,-600;linear,0.1;diffusealpha,1;linear,0.5;zoom,1;diffusealpha,0;);
	};
	
};
local t = Def.ActorFrame {};
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
		--[[
		-- コース中はmetricsをリロードできないっぽいから、解決できるまでコースは全部ダンサーを表示させる
		-- BGAnimations\ScreenGameplay next course songにも作りかけ有り
		if GAMESTATE:IsCourseMode() then
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
		else
			song = GAMESTATE:GetCurrentSong();
		end;
		--]]
		if GAMESTATE:IsCourseMode() or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			WritePrefToFile("FirstReMIX_ShowDancingCharacters",true);
		else
			local song = GAMESTATE:GetCurrentSong();
			if song:HasBGChanges() then
				WritePrefToFile("FirstReMIX_ShowDancingCharacters",false);
			else
				WritePrefToFile("FirstReMIX_ShowDancingCharacters",true);
			end;
		end;
	end; 
	OnCommand=function(self)
		if GAMESTATE:GetPlayMode() ~= 'PlayMode_Rave' then
			THEME:ReloadMetrics();
		end;
	end; 
};
-- Load BestScore List
local function GetProfileHighScores(pn)
	local profile = PROFILEMAN:GetProfile(pn);
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = GAMESTATE:GetCurrentSong()
		local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
	assert(scorelist);
	return scorelist:GetHighScores();
end;

-- Load TopScore List
local function GetMachineHighScores(pn)
	local profile = PROFILEMAN:GetMachineProfile();
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = GAMESTATE:GetCurrentSong()
		local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
	assert(scorelist);
	return scorelist:GetHighScores();
end;

-- Score
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) and GAMESTATE:GetPlayMode() ~= 'PlayMode_Rave' then
		local bTargetScore = TargetScore(pn);
		-- Difficulty
		t[#t+1] = Def.ActorFrame {
			InitCommand = function(self)
				self:player(pn);
				self:y(WideScale(SCREEN_CENTER_Y+128,SCREEN_CENTER_Y+101));
				self:zoom(WideScale(0.8,1));
				if pn == PLAYER_1 then
					self:x(WideScale(SCREEN_CENTER_X-218,SCREEN_CENTER_X-299));
				else
					self:x(WideScale(SCREEN_CENTER_X+218,SCREEN_CENTER_X+299));
				end;
			end;
			OnCommand = function(self)
				if pn == PLAYER_1 then
					self:addx(-270);
					self:sleep(1);
					self:linear(0.2);
					self:addx(270);
				else
					self:addx(270);
					self:sleep(1);
					self:linear(0.2);
					self:addx(-270);
				end;
			end;
			-- Difficulty Back
			LoadActor(THEME:GetPathB("ScreenGameplay","decorations/DifficultyFrame")) .. {
				InitCommand = function(self)
					if pn == PLAYER_1 then
						self:x(-57);
					else
						self:x(57);
						self:rotationy(180);
					end;
				end;
			};
			-- Difficulty text
			LoadFont("_serpentinedbol 19px") .. {
				InitCommand=function(self)
					(cmd(zoomy,0.8;zoomx,WideScale(0.8,1)))(self)
					if pn == PLAYER_1 then
						self:x(-62);
					else
						self:x(62);
					end;
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
					self:diffuse(CustomDifficultyToColor(diff));
				end;
			};
		};

		-- Best Score
		if PROFILEMAN:IsPersistentProfile(pn) then
			t[#t+1] = Def.ActorFrame {
				InitCommand = function(self)
					self:player(pn);
					self:y(WideScale(SCREEN_CENTER_Y+154,SCREEN_CENTER_Y+134));
					self:zoom(WideScale(0.8,1));
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-218,SCREEN_CENTER_X-299));
					else
						self:x(WideScale(SCREEN_CENTER_X+218,SCREEN_CENTER_X+299));
					end;
				end;
				OnCommand = function(self)
					if pn == PLAYER_1 then
						self:addx(-270);
						self:sleep(1);
						self:linear(0.2);
						self:addx(270);
					else
						self:addx(270);
						self:sleep(1);
						self:linear(0.2);
						self:addx(-270);
					end;
				end;
				-- BestScore Back
				LoadActor(THEME:GetPathB("ScreenStageInformation","in/Score_Back_a")) .. {
					InitCommand = function(self)
						if pn == PLAYER_2 then
							self:rotationy(180);
						end;
					end;
				};
				-- Bestscore Text
				LoadFont("Common Normal") .. {
					InitCommand=function(self)
						(cmd(diffuse,color("#00ff00");y,-18-1;zoom,0.45))(self)
						if pn == PLAYER_1 then
							self:x(-71);
						else
							self:x(71);
						end;
						self:settext(THEME:GetString("ScreenStageInformation","BestScore"));
					end;
				};
				-- Bestscore Name
				LoadFont("Common Normal") .. {
					InitCommand=function(self)
						(cmd(horizalign,left;y,-2-1;maxwidth,165;shadowlength,1;zoomy,0.7))(self);
						if pn == PLAYER_1 then
							self:x(-120);
						else
							self:x(-37);
						end;
						local profile = PROFILEMAN:GetProfile(pn);
						local profilename = profile:GetDisplayName();
						local scores = GetProfileHighScores(pn);
						assert(scores);
						local bestscore=0;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								bestscore = scores[1]:GetScore();
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local bestscore2 = GetSN2Score(pn,steps,scores[i]);
										if bestscore2 > bestscore then
											bestscore = bestscore2;
										end;
									else
										break;
									end;
								end;
							end;
						end;
						assert(bestscore);
						if bestscore == 0 then
							self:settext(" - - - - - - - -");
						else
							self:settext(profilename);
						end;
					end;
				};
				-- BestScore Number
				Def.RollingNumbers {
					File=THEME:GetPathF("ScoreDisplayNormal","Text");
					InitCommand=function(self)
						(cmd(Load,"RollingNumbersStageInScore";horizalign,left;y,9-1;maxwidth,125;shadowlength,1;zoomx,1.25))(self);
						if pn == PLAYER_1 then
							self:x(-120);
						else
							self:x(-37);
						end;
						local scores = GetProfileHighScores(pn);
						assert(scores);
						local bestscore=0;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								bestscore = scores[1]:GetScore();
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local bestscore2 = GetSN2Score(pn,steps,scores[i]);
										if bestscore2 > bestscore then
											bestscore = bestscore2;
										end;
									else
										break;
									end;
								end;
							end;
						end;
						assert(bestscore);
						self:targetnumber(bestscore);
					end;
				};
				-- BestScore FullComboRing
				LoadActor(THEME:GetPathB("ScreenSelectMusic","decorations/Full_Combo_Mini"))..{
					InitCommand=function(self)
						if GAMESTATE:GetPlayMode() == "PlayMode_Endless" then return self:visible(false) end;
						(cmd(zoom,1.25;y,-15-1))(self);
						if pn == PLAYER_1 then
							self:x(102);
						else
							self:x(-82);
						end;
						local scores = GetProfileHighScores(pn);
						assert(scores);
						local topscore;
						local bestscore = 0;
						local list = 1;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								topscore = scores[1];
								assert(topscore);
								local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
								local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
								local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
								local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
								local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
								-- スコア0で記録したとき、途中でクリアしたときの対策
								if topscore:GetScore() > 0 and scores[1]:GetGrade() ~= "Grade_Tier08" then
									if (misses+boos) == 0 then
										if (goods+greats+perfects) == 0 then
											self:diffuse(color("#ffffff"));
										elseif (goods+greats) == 0 then
											self:diffuse(color("#ffff00"));
										elseif goods == 0 then
											self:diffuse(color("#01e603"));
										else
											self:diffuse(color("#10e0f1"));
										end;
									else
										self:visible(false);
									end;
								else
									self:visible(false);
								end;
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local bestscore2 = GetSN2Score(pn,steps,scores[i]);
										if bestscore2 > bestscore then
											bestscore = bestscore2;
											list = i;
										end;
									else
										break;
									end;
								end;
							
								topscore = scores[list];
								assert(topscore);
								local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
								local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
								local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
								local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
								local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
								-- スコア0で記録したとき、途中でクリアしたときの対策
								if bestscore > 0 and scores[list]:GetGrade() ~= "Grade_Tier08" then
									if (misses+boos) == 0 then
										if (goods+greats+perfects) == 0 then
											self:diffuse(color("#ffffff"));
										elseif (goods+greats) == 0 then
											self:diffuse(color("#ffff00"));
										elseif goods == 0 then
											self:diffuse(color("#01e603"));
										else
											self:diffuse(color("#10e0f1"));
										end;
									else
										self:visible(false);
									end;
								else
									self:visible(false);
								end;
							end;
						else
							self:visible(false);
						end;
					end;
				};
				-- BestScore Grade
				Def.Sprite{
					InitCommand=function(self)
						if GAMESTATE:GetPlayMode() == "PlayMode_Endless" then return end;
						(cmd(zoom,1.25;y,-7-1))(self);
						if pn == PLAYER_1 then
							self:x(92);
						else
							self:x(-92);
						end;
						local scores = GetProfileHighScores(pn);
						assert(scores);
						local topgrade;
						local bestscore = 0;
						local list = 1;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								topgrade = scores[1]:GetGrade();
								assert(topgrade);
								if scores[1]:GetScore() > 0 then
									self:LoadBackground(THEME:GetPathB("ScreenSelectMusic decorations/Grade/GradeDisplayEval",ToEnumShortString(topgrade)));
								else
									self:visible(false);
								end;
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local bestscore2 = GetSN2Score(pn,steps,scores[i]);
										if bestscore2 > bestscore then
											bestscore = bestscore2;
											list = i;
										end;
									else
										break;
									end;
								end;
								topgrade = scores[list]:GetGrade();
								assert(topgrade);
								if bestscore > 0 then
									self:LoadBackground(THEME:GetPathB("ScreenSelectMusic decorations/Grade/GradeDisplayEval",ToEnumShortString(topgrade)));
								else
									self:visible(false);
								end;
							end;
						else
							self:visible(false);
						end;
					end;
				};
			};
		end;

		-- TargetScore or TopScore
		-- 基本はターゲットスコア用だが、プロフィールが未使用時の場合も利用する
		if not GAMESTATE:IsCourseMode() or (GAMESTATE:IsCourseMode() and not PROFILEMAN:IsPersistentProfile(pn)) then
			t[#t+1] = Def.ActorFrame {
				InitCommand = function(self)
					self:player(pn);
					self:zoom(WideScale(0.8,1));
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-218,SCREEN_CENTER_X-299));
					else
						self:x(WideScale(SCREEN_CENTER_X+218,SCREEN_CENTER_X+299));
					end;
					if PROFILEMAN:IsPersistentProfile(pn) then
						self:y(WideScale(SCREEN_CENTER_Y+196-1,SCREEN_CENTER_Y+186-1));
					else
						self:y(WideScale(SCREEN_CENTER_Y+154,SCREEN_CENTER_Y+134));
					end;
				end;
				OnCommand = function(self)
					if PROFILEMAN:IsPersistentProfile(pn) then
						if pn == PLAYER_1 then
							self:addx(-270);
							self:sleep(1.2);
							self:linear(0.2);
							self:addx(270);
						else
							self:addx(270);
							self:sleep(1.2);
							self:linear(0.2);
							self:addx(-270);
						end;
					else
						if pn == PLAYER_1 then
							self:addx(-270);
							self:sleep(1);
							self:linear(0.2);
							self:addx(270);
						else
							self:addx(270);
							self:sleep(1);
							self:linear(0.2);
							self:addx(-270);
						end;
					end;
				end;
				-- TargetScore Back
				Def.Sprite {
					InitCommand = function(self)
						if PROFILEMAN:IsPersistentProfile(pn) then
							self:Load(THEME:GetPathB("ScreenStageInformation","in/Score_Back_b"));
						else
							if bTargetScore == "off" then
								self:Load(THEME:GetPathB("ScreenStageInformation","in/Score_Back_a"));
							else
								if GAMESTATE:IsCourseMode() then
									self:Load(THEME:GetPathB("ScreenStageInformation","in/Score_Back_a"));
								else
									self:Load(THEME:GetPathB("ScreenStageInformation","in/Score_Back_b"));
								end;
							end;
						end;
						if pn == PLAYER_2 then
							self:rotationy(180);
						end;
					end;
				};
				-- TargetScore Text
				LoadFont("Common Normal") .. {
					InitCommand=function(self)
						(cmd(diffuse,color("#ffff00");y,-18-1;zoom,0.45))(self);
						if pn == PLAYER_1 then
							self:x(-71);
						else
							self:x(71);
						end;
						if PROFILEMAN:IsPersistentProfile(pn) then
							self:settext(THEME:GetString("ScreenStageInformation","TargetScore"));
						else
							if bTargetScore == "off" then
								self:diffuse(color("#00ff00"));
								self:settext(THEME:GetString("ScreenStageInformation","TopScore"));
							else
								if GAMESTATE:IsCourseMode() then
									self:diffuse(color("#00ff00"));
									self:settext(THEME:GetString("ScreenStageInformation","TopScore"));
								else
									self:settext(THEME:GetString("ScreenStageInformation","TargetScore"));
								end;
							end;
						end;
					end;
				};	
				-- TargetScore Name
				LoadFont("Common Normal")..{
					InitCommand=function(self)
						(cmd(horizalign,left;y,-2-1;maxwidth,165;shadowlength,1;zoomy,0.7))(self);
						if pn == PLAYER_1 then
							self:x(-120);
						else
							self:x(-37);
						end;
						local scores;
						if PROFILEMAN:IsPersistentProfile(pn) then
							if bTargetScore == "machine" then
								scores = GetMachineHighScores(pn);
							elseif bTargetScore == "personal" then
								scores = GetProfileHighScores(pn);
							elseif bTargetScore == "off" then
								self:settext(" - - - - - - - -");
								return;
							end;
						else
							scores = GetMachineHighScores(pn);
						end;
						assert(scores);
						local topscore=0;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								topscore = scores[1]:GetScore();
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local topscore2 = GetSN2Score(pn,steps,scores[i]);
										if topscore2 > topscore then
											topscore = topscore2;
										end;
									else
										break;
									end;
								end;
							end;
						end;
						assert(topscore);
						if topscore == 0 then
							self:settext(" - - - - - - - -");
						elseif PROFILEMAN:IsPersistentProfile(pn) and bTargetScore == "personal" then
							local profile = PROFILEMAN:GetProfile(pn);
							local profilename = profile:GetDisplayName();
							self:settext(profilename);
						else
							if PROFILEMAN:GetNumLocalProfiles() > 0 then
								for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
									local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
									local scorelist;
									if GAMESTATE:IsCourseMode() then
										local course = GAMESTATE:GetCurrentCourse();
										local Trail = GAMESTATE:GetCurrentTrail(pn);
										scorelist = profile:GetHighScoreList(course,Trail);
									else
										local song = GAMESTATE:GetCurrentSong()
										local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
										local steps = song:GetOneSteps( st, diff );
										scorelist = profile:GetHighScoreList(song,steps);
									end;
									assert(scorelist);
									local scores2 = scorelist:GetHighScores();
									assert(scores2);
									local topscore2=0;
									if scores2[1] then
										if GAMESTATE:IsCourseMode() then
											topscore2 = scores2[1]:GetScore();
										else
											local song = GAMESTATE:GetCurrentSong()
											local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
											local steps = song:GetOneSteps( st, diff );
											for i = 1, #scores2 do
												if scores2[i] then
													local topscore3 = GetSN2Score(pn,steps,scores2[i]);
													if topscore3 > topscore2 then
														topscore2 = topscore3;
													end;
												end;
											end;
										--	topscore2 = GetSN2Score(pn,steps,scores2[1]);
										end;
									end;
									assert(topscore2);
									if topscore == topscore2 then
										self:settext(profile:GetDisplayName());
										break;
									else
										self:settext(" - - - - - - - -");
									end;
								end;
							else
								self:settext(" - - - - - - - -");
							end;
						end;
					end;
				};
				-- TargetScore Number
				Def.RollingNumbers {
					File=THEME:GetPathF("ScoreDisplayNormal","Text");
					InitCommand=function(self)
						(cmd(Load,"RollingNumbersStageInScore";horizalign,left;y,9-1;maxwidth,125;shadowlength,1;zoomx,1.25))(self);
						if pn == PLAYER_1 then
							self:x(-120);
						else
							self:x(-37);
						end;
						local scores;
						if PROFILEMAN:IsPersistentProfile(pn) then
							if bTargetScore == "machine" then
								scores = GetMachineHighScores(pn);
							elseif bTargetScore == "personal" then
								scores = GetProfileHighScores(pn);
							elseif bTargetScore == "off" then
								self:targetnumber(0);
								return;
							end;
						else
							scores = GetMachineHighScores(pn);
						end;
						assert(scores);
						local topscore=0;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								topscore = scores[1]:GetScore();
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local topscore2 = GetSN2Score(pn,steps,scores[i]);
										if topscore2 > topscore then
											topscore = topscore2;
										end;
									else
										break;
									end;
								end;
							end;
						end;
						assert(topscore);
						self:targetnumber(topscore);
					end;
				};	
				-- TargetScore FullComboRing
				LoadActor(THEME:GetPathB("ScreenSelectMusic","decorations/Full_Combo_Mini"))..{
					InitCommand=function(self)
						if GAMESTATE:GetPlayMode() == "PlayMode_Endless" then return self:visible(false) end;
						(cmd(zoom,1.25;y,-15-1))(self);
						if pn == PLAYER_1 then
							self:x(102);
						else
							self:x(-82);
						end;
						local scores;
						if PROFILEMAN:IsPersistentProfile(pn) then
							if bTargetScore == "machine" then
								scores = GetMachineHighScores(pn);
							elseif bTargetScore == "personal" then
								scores = GetProfileHighScores(pn);
							elseif bTargetScore == "off" then
								self:visible(false);
								return;
							end;
						else
							scores = GetMachineHighScores(pn);
						end;
						assert(scores);
						local topscore;
						local topscore0 = 0;
						local list = 1;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								topscore = scores[1];
								assert(topscore);
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local topscore2 = GetSN2Score(pn,steps,scores[i]);
										if topscore2 > topscore0 then
											topscore0 = topscore2;
											list = i;
										end;
									else
										break;
									end;
								end;
								topscore = scores[list];
								assert(topscore);
							end;
							local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
							local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
							local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
							local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
							local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
							-- スコア0で記録したとき、途中でクリアしたときの対策
							if topscore:GetScore() > 0 and scores[list]:GetGrade() ~= "Grade_Tier08" then
								if (misses+boos) == 0 then
									if (goods+greats+perfects) == 0 then
										self:diffuse(color("#ffffff"));
									elseif (goods+greats) == 0 then
										self:diffuse(color("#ffff00"));
									elseif goods == 0 then
										self:diffuse(color("#01e603"));
									else
										self:diffuse(color("#10e0f1"));
									end;
								else
									self:visible(false);
								end;
							else
								self:visible(false);
							end;
						else
							self:visible(false);
						end;
					end;
				};
				-- TargetScore Grade
				Def.Sprite {
					InitCommand=function(self)
						if GAMESTATE:GetPlayMode() == "PlayMode_Endless" then return end;
						(cmd(zoom,1.25;y,-7-1))(self);
						if pn == PLAYER_1 then
							self:x(92);
						else
							self:x(-92);
						end;
						local scores;
						if PROFILEMAN:IsPersistentProfile(pn) then
							if bTargetScore == "machine" then
								scores = GetMachineHighScores(pn);
							elseif bTargetScore == "personal" then
								scores = GetProfileHighScores(pn);
							elseif bTargetScore == "off" then
								return;
							end;
						else
							scores = GetMachineHighScores(pn);
						end;
						assert(scores);
						local topgrade;
						local topscore = 0;
						if scores[1] then
							if GAMESTATE:IsCourseMode() then
								topgrade = scores[1]:GetGrade();
								assert(topgrade);
								if scores[1]:GetScore() > 0 then
									self:LoadBackground(THEME:GetPathB("ScreenSelectMusic decorations/Grade/GradeDisplayEval",ToEnumShortString(topgrade)));
								else
									self:visible(false);
								end;
							else
								local song = GAMESTATE:GetCurrentSong()
								local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
								local steps = song:GetOneSteps( st, diff );
								for i = 1, #scores do
									if scores[i] then
										local topscore2 = GetSN2Score(pn,steps,scores[i]);
										if topscore2 > topscore then
											topscore = topscore2;
											list = i;
										end;
									else
										break;
									end;
								end;
								topgrade = scores[list]:GetGrade();
								assert(topgrade);
								if topscore > 0 then
									self:LoadBackground(THEME:GetPathB("ScreenSelectMusic decorations/Grade/GradeDisplayEval",ToEnumShortString(topgrade)));
								else
									self:visible(false);
								end;
							end;
						else
							self:visible(false);
						end;
					end;
				};
			};
		end
	end
end
