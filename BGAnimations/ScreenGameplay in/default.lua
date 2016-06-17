local t = Def.ActorFrame {};
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
-- test
--[[
t[#t+1] = LoadFont("common normal") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+185;zoom,2);
	OnCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local start = song:GetFirstBeat();
		local last = song:GetLastBeat();
		local dispBpms = song:GetDisplayBpms()
		local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
		self:settext(dispBpms[1]);
	end;
};
t[#t+1] = LoadFont("common normal") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+185-50;zoom,2);
	OnCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local start = song:GetFirstBeat();
		local last = song:GetLastBeat();
		local dispBpms = song:GetDisplayBpms()
		local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
		self:settext(start);
	end;
};
t[#t+1] = LoadFont("common normal") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+185-50-50;zoom,2);
	OnCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local start = song:GetFirstBeat();
		local last = song:GetLastBeat();
		local dispBpms = song:GetDisplayBpms()
		local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
		local startps = (60/dispBpms[1])*(start-4)
		self:settext(startps);
	end;
};

t[#t+1] = LoadActor(THEME:GetPathB("","door1")) .. {
	InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.2);
	OnCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local start = song:GetFirstBeat();
		local last = song:GetLastBeat();
		local dispBpms = song:GetDisplayBpms()
		local startps = (60/dispBpms[1])*(start-4)
		self:diffusealpha(0);
		if startps < 0 or startps > 10 then
			self:sleep(0);
		else
			self:sleep(startps);
		end;
		self:diffusealpha(1);
	end;
};
--]]

-- Door
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","StageinBG")) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.2;linear,0.25;diffusealpha,0);
	};
--[[	LoadActor(THEME:GetPathB("","door1")) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,0.25;addx,-SCREEN_WIDTH*0.5);
	};
	LoadActor(THEME:GetPathB("","doorbottan1")) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_LEFT;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,0.25;addx,-SCREEN_WIDTH*0.5);
	};
	LoadActor(THEME:GetPathB("","door2")) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.5);
	};
	LoadActor(THEME:GetPathB("","doorbottan2")) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.5);
	}; ]]--
};

-- CDImage
t[#t+1] = Def.Sprite{
	InitCommand=function(self)
		local song=GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:LoadBackground(song:GetCDImagePath());
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(song:GetCDImagePath());
		end;
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y+80);
		self:scaletoclipped(256,256);
	end;
	OnCommand=cmd(linear,0.099;zoomy,0);
};
--[[	
-- Jacket line or Banner line
t[#t+1] = Def.Banner{
	InitCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y-93);
			self:LoadBackground(GetJacketBanner(song));
		elseif not GAMESTATE:IsCourseMode() then
			self:LoadBackground(GetJacketBanner(song));
			if self:GetWidth() == self:GetHeight() then
				self:Center();
			else
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-135);
			end;
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(GetJacketBanner(song));
			if song:HasCDImage() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-93);
			else
				if self:GetWidth() == self:GetHeight() then
					self:Center();
				else
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-135);
				end;
			end;
		end;
		self:scale_to_clip_banner_line();
		self:diffuse(color("#000000"));
	end;
	OnCommand=cmd(zoom,1.333;linear,0.25;diffuse,0);
}; ]]--
-- Jacket or Banner
t[#t+1] = Def.Banner{
	InitCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:LoadBackground(GetJacketBanner(song));
		elseif not GAMESTATE:IsCourseMode() then
			self:LoadBackground(GetJacketBanner(song));
			------------- position  SQUARE BANNER -------
			if self:GetWidth() == self:GetHeight() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-15);
			else
			------------ POSITION ONG RECTANGLE BANNER-----
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-150);
			end;
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(GetJacketBanner(song));
			if song:HasCDImage() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y);
			else
				if self:GetWidth() == self:GetHeight() then
					self:Center();
				else
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-100);
				end;
			end;
		end;
		self:diffuse(color("#000000"));
		self:banner_scale_stage_line();
	end;
	OnCommand=cmd(sleep,0.2;linear,0.25;diffusealpha,0);
};	
-- Jacket or Banner
t[#t+1] = Def.Banner{
	InitCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if not GAMESTATE:IsCourseMode() and song:HasCDImage() then
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:LoadBackground(GetJacketBanner(song));
		elseif not GAMESTATE:IsCourseMode() then
			self:LoadBackground(GetJacketBanner(song));
			------------- position  SQUARE BANNER -------
			if self:GetWidth() == self:GetHeight() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-15);
			else
			------------ POSITION ONG RECTANGLE BANNER-----
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y-150);
			end;
		else
			-- From waiei by A.c
			local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
			local e = trail:GetTrailEntries()
			if #e > 0 then
				song = e[1]:GetSong()
			end;
			self:LoadBackground(GetJacketBanner(song));
			if song:HasCDImage() then
				self:x(SCREEN_CENTER_X);
				self:y(SCREEN_CENTER_Y);
			else
				if self:GetWidth() == self:GetHeight() then
					self:Center();
				else
					self:x(SCREEN_CENTER_X);
					self:y(SCREEN_CENTER_Y-100);
				end;
			end;
		end;
		self:banner_scale_stage();
	end;
	OnCommand=cmd(sleep,0.2;linear,0.25;diffusealpha,0);
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
				self:y(SCREEN_CENTER_Y+165);
				self:zoom(WideScale(0.8,1));
				if pn == PLAYER_1 then
					self:x(WideScale(SCREEN_CENTER_X-218,SCREEN_CENTER_X-299));
				else
					self:x(WideScale(SCREEN_CENTER_X+218,SCREEN_CENTER_X+299));
				end;
			end;
			OnCommand = function(self)
			    if pn == PLAYER_1 then
				self:sleep(0.05);
				self:linear(0.2);
				self:addy(600);
				self:queuecommand("Visible")
				else
				self:sleep(0.05);
				self:linear(0.2);
				self:addy(600);
				self:queuecommand("Visible")
				end;
			end;
			VisibleCommand = function(self)
				self:visible(false);
			end;
			-- Difficulty Back
			LoadActor(THEME:GetPathB("ScreenGameplay","decorations/DifficultyFrame")) .. {
				InitCommand = function(self)
					if pn == PLAYER_1 then
						self:x(-100);
					else
						self:x(100);
						self:rotationy(180);
					end;
				end;
			};
			-- Difficulty text
			LoadFont("_futura std medium 20px") .. {
				InitCommand=function(self)
					(cmd(zoomy,0.7;zoomx,0.9))(self)
					if pn == PLAYER_1 then
						self:x(0);
					else
						self:x(100);
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
					self:y(SCREEN_CENTER_Y+210);
					self:zoom(WideScale(0.8,1));
					if pn == PLAYER_1 then
						self:x(WideScale(SCREEN_CENTER_X-218,SCREEN_CENTER_X-299));
					else
						self:x(WideScale(SCREEN_CENTER_X+218,SCREEN_CENTER_X+299));
					end;
				end;
				OnCommand = function(self)
				if pn == PLAYER_1 then
					self:sleep(0.05);
					self:linear(0.2);
					self:addy(600);
					self:queuecommand("Visible")
					else
					self:sleep(0.05);
					self:linear(0.2);
					self:addy(600);
					self:queuecommand("Visible")
					end;
				end;
				VisibleCommand = function(self)
					self:visible(false);
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
						(cmd(diffuse,color("#00ff00");y,-17-1;zoom,0.45))(self)
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
						(cmd(Load,"RollingNumbersStageInScore";horizalign,left;y,5;maxwidth,300;shadowlength,1;zoom,0.8))(self);
						if pn == PLAYER_1 then
							self:x(-110);
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
						(cmd(zoom,0.4;y,-7-1))(self);
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
						self:y(SCREEN_CENTER_Y+280);
					else
						self:y(SCREEN_CENTER_Y+280);
					end;
				end;
				OnCommand = function(self)
					if PROFILEMAN:IsPersistentProfile(pn) then
					    if pn == PLAYER_1 then
						self:linear(0.2);
						self:addy(600);
					else	
						self:linear(0.2);
						self:addy(600);
					end;
					self:queuecommand("Visible")
					end;
				end;
				VisibleCommand = function(self)
					self:visible(false);
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
						(cmd(diffuse,color("#ffff00");y,-17-1;zoom,0.45))(self);
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
						(cmd(Load,"RollingNumbersStageInScore";horizalign,left;y,5;maxwidth,300;shadowlength,1;zoom,0.8))(self);
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
						(cmd(zoom,0.4;y,-7-1))(self);
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


--[[
-- Score
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) and GAMESTATE:GetPlayMode() ~= 'PlayMode_Rave' then
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
				self:sleep(0.05);
				self:linear(0.2);
				self:addy(270);
				self:queuecommand("Visible")
			end;
			VisibleCommand = function(self)
				self:visible(false);
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
					self:sleep(0.05);
					self:linear(0.2);
					self:addy(270);
					self:queuecommand("Visible")
				end;
				VisibleCommand = function(self)
					self:visible(false);
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
						(cmd(diffuse,color("#00ff00");y,-18;zoom,0.47))(self)
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
						(cmd(horizalign,left;y,-2;maxwidth,165;shadowlength,1;zoomy,0.7))(self);
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
						(cmd(Load,"RollingNumbersStageInScore";horizalign,left;y,9;maxwidth,125;shadowlength,1;zoomx,1.25))(self);
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
						(cmd(zoom,1.25;y,-15))(self);
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
						(cmd(zoom,1.25;y,-7))(self);
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
						self:y(WideScale(SCREEN_CENTER_Y+196,SCREEN_CENTER_Y+186));
					else
						self:y(WideScale(SCREEN_CENTER_Y+154,SCREEN_CENTER_Y+134));
					end;
				end;
				OnCommand = function(self)
					if PROFILEMAN:IsPersistentProfile(pn) then
						self:linear(0.2);
						self:addy(270);
					else
						self:sleep(0.05);
						self:linear(0.2);
						self:addy(270);
					end;
					self:queuecommand("Visible")
				end;
				VisibleCommand = function(self)
					self:visible(false);
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
									self:Load(THEME:GetPathB("ScreenStageInformation","in/Score_Back_c"));
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
						(cmd(diffuse,color("#ffff00");y,-18;zoom,0.47))(self);
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
						(cmd(horizalign,left;y,-2;maxwidth,165;shadowlength,1;zoomy,0.7))(self);
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
						(cmd(Load,"RollingNumbersStageInScore";horizalign,left;y,9;maxwidth,125;shadowlength,1;zoomx,1.25))(self);
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
						(cmd(zoom,1.25;y,-15))(self);
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
						(cmd(zoom,1.25;y,-7))(self);
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




--]]

return t;