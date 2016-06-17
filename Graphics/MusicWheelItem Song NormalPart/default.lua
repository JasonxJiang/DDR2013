--[[[
-- ホイール鏡面反射用
function Actor:zoom_to_bannerX()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(192,192);
		self:fadetop(1);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(250,100);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(226,110);
	else
	-- その他、通常DDR	
		self:zoomto(256,80);
		self:fadetop(0.7);
		self:fadebottom(0.3);
	end
end			
--]]
local t = Def.ActorFrame {};

t[#t+1] = LoadActor("jacket") .. {
	InitCommand=cmd(x,0;y,101;scaletoclipped,256,256);
--	OnCommand=cmd(diffuse,color("0,0,0,1");diffusealpha,0.5)
	OnCommand=cmd(diffusealpha,1);
    };
t[#t+1] = Def.ActorFrame{
	Def.Banner {
		SetMessageCommand=function(self,params)
			self:LoadBackground(GetJacketBanner(params.Song));
			self:zoom_to_banner();
			self:draworder(-100);
			if self:GetWidth() == self:GetHeight() then
		    self:diffusealpha(0.5);
			else
			self:diffusealpha(0);
			end
			self:rotationz(180);
			self:croptop(0.8);
			self:diffusetopedge(0,0,0,0);
			self:y(357);
			
		end;
	};
};	
t[#t+1] = Def.ActorFrame{
	Def.Banner {
		SetMessageCommand=function(self,params)
			self:LoadBackground(GetJacketBanner(params.Song));
			self:zoom_to_banner();
			self:y(101);
		end;
	};
	
	-- Move test
	--[[
	SetMessageCommand=function(self,params)
		if params.DrawIndex > 8 then
		--	self:y(200);
			self:addz(150+150*(params.DrawIndex-8));
			self:sleep((16-params.DrawIndex)*0.005);
			self:linear(0.3);
			self:addz(-150-150*(params.DrawIndex-8));
		end;
	end;
	LoadFont("Common Normal")..{
		InitCommand=cmd(zoom,3;strokecolor,color("#000000"));
		SetMessageCommand=function(self, params)
			self:settext(params.DrawIndex);
		end;
	};
	--]]
	
--[[	
--	LoadActor(THEME:GetPathB("ScreenSelectMusic","decorations/Full_Combo_Mini")) .. {
	LoadFont("_serpentinedbol 19px") .. {
		InitCommand=cmd(zoom,1;y,-30);
		SetCommand=function(self,params)
			self:strokecolor(0,0,0,1);
		--	local title = params.Song:GetDisplayMainTitle();
			local st = GAMESTATE:GetCurrentStyle():GetStepsType();
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
			local steps = params.Song:GetOneSteps( st, diff );
			
				if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
					-- player profile
					profile = PROFILEMAN:GetProfile(PLAYER_1);
				end;
				
				scorelist = profile:GetHighScoreList(params.Song,steps);
			
				assert(scorelist);
				local scores = scorelist:GetHighScores();
				assert(scores);
				local topscore=0;
				if scores[1] then
					topscore = scores[1]:GetScore();
				end;
				assert(topscore);
				if topscore==0 then
					self:settext("000");
				else
					local scorel3 = topscore%1000;
					local scorel2 = (topscore/1000)%1000;
					local scorel1 = (topscore/1000000)%1000000;
					self:settextf("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
				--	self:settextf("%07d",topscore);
				end;
			--self:settext(title);
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	};
--]]	
	
--[[
	-- Score
	LoadFont("Common Normal")..{
		InitCommand=cmd(zoom,1;playcommand,"Set");
		SetCommand=function(self, params)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			local song = params.Song;
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
				-- player profile
				profile = PROFILEMAN:GetProfile(PLAYER_1);
			else
				-- machine profile
				profile = PROFILEMAN:GetMachineProfile();
			end;
			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local topscore=0;
			if scores[1] then
				topscore = scores[1]:GetScore();
			end;
			assert(topscore);
			--topscore=10;
			self:strokecolor(0,0,0,1);
			self:diffusealpha(1);
			-- Score from DDR X2 AC by KENP
			if topscore==0 then
				self:settext("");
			else
			--	self:settextf("%09d",topscore);
				local scorel3 = topscore%1000;
				local scorel2 = (topscore/1000)%1000;
				local scorel1 = (topscore/1000000)%1000000;
				self:settextf("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
			end;
		end;
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	};
--]]

	
--[[
	LoadActor(THEME:GetPathB("ScreenSelectMusic","decorations/Full_Combo_Mini"))..{
		InitCommand = cmd(zoom,20);
		SetMessageCommand=function(self, params)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			local song = params.Song;
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			profile = PROFILEMAN:GetProfile(PLAYER_1);
			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
			local scores = scorelist:GetHighScores();
			assert(scores);
			local topscore;
			if scores[1] then
				topscore = scores[1];
				assert(topscore);
				local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
				local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
				local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
				local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
				local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
				if (misses+boos+goods) == 0 then
					if (greats+perfects) == 0 then
						self:diffuse(color("#ffffff"));
						self:visible(false);
					elseif greats == 0 then
						self:diffuse(color("#ffff00"));
						self:visible(false);
					else
						self:diffuse(color("#01e603"));
						self:visible(true);
					end;
				else 
					self:visible(false);
				end;
			else
				self:visible(false);
			end;
		end;
	};
	--]]
	-- 鏡面反射テスト
	--[[
	Def.Banner {
		SetMessageCommand=function(self,params)
			self:LoadBackground(GetJacketBanner(params.Song));
			self:rotationx(180);
			self:zoom_to_bannerX();
			self:y(192);
			self:diffusealpha(0.5);
		end;
	};
	--]]
	--[[
	-- Base from moonlight by AJ 187
	LoadActor("WheelNotifyIcon")..{
		InitCommand=cmd(zoom,1;y,-105);
		SetCommand=function(self,params)
			self:visible(false);
			if GAMESTATE:GetSortOrder() == 'SortOrder_Popularity' then
				if params.Index > 2 then
					self:visible(false);
				else
					self:visible(true);
				end;
			end;
		--	if params.HasFocus then
		--		self:x(-90);
		--	else
		--		self:x(0);
		--	end;
		end;
	};
	LoadFont("_serpentinedbol 19px")..{
		InitCommand=cmd(diffuse,color("#fff90a");zoom,1.22;y,-106);
		SetCommand=function(self,params)
			self:visible(false);
			if GAMESTATE:GetSortOrder() == 'SortOrder_Popularity' then
				self:visible(true);
				if params.Index == 0 then
					self:settext("1");
					self:x(-1);
				elseif params.Index == 1 then
					self:settext("2");
					self:x(0);
				elseif params.Index == 2 then
					self:settext("3");
					self:x(0);
				else
					self:visible(false);
				end;
			end;
		--	if params.HasFocus then
		--		self:x(-90);
		--	else
		--		self:x(0);
		--	end;
		end;
	};
	--]]
};

local st = GAMESTATE:GetCurrentStyle():GetStepsType();

-- BestScore List
local function GetProfileHighScores(pn)
	local profile = PROFILEMAN:GetProfile(pn);
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = GAMESTATE:GetCurrentSong()
	--	local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
		local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
--	assert(scorelist);
	return scorelist:GetHighScores();
end;

-- TopScore List
local function GetMachineHighScores(pn)
	local profile = PROFILEMAN:GetMachineProfile();
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = GAMESTATE:GetCurrentSong()
		local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
	return scorelist:GetHighScores();
end;

-- Load BestScore List
local function GetProfileHighScores2(pn,params)
	local profile = PROFILEMAN:GetProfile(pn);
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = params.Song;
		local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
			if song:HasStepsTypeAndDifficulty(st,diff) then
				local steps = song:GetOneSteps( st, diff );
				scorelist = profile:GetHighScoreList(song,steps);
				assert(scorelist);
				return scorelist:GetHighScores();
			else
				return false;
			end;
	end;
--	assert(scorelist);
--	return scorelist:GetHighScores();
end;



--[[
-- FullCombo label side
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor(THEME:GetPathG("MusicWheelItem","grades/FullCombo")) .. {
		InitCommand=cmd(pause;zoom,0.9;setstate,5;y,-60);
		SetMessageCommand=function(self,params)
			if params.HasFocus then self:linear(0) self:diffusealpha(0) return end;
			self:diffusealpha(1)
			if pn == PLAYER_1 then
				self:x(-40);
			else
				self:x(40);
			end;
			local scores;
			if PROFILEMAN:IsPersistentProfile(pn) then
				scores = GetProfileHighScores2(pn,params);
			else
				scores = GetMachineHighScores2(pn,params);
			end;
		--	local scores = GetProfileHighScores2(pn,params);
			local topscore;
			local bestscore = 0;
			local list = 1;
			if scores[1] then
				if GAMESTATE:IsCourseMode() then
					topscore = scores[1];
					local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
					local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
					local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
					local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
					local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
					if topscore:GetScore() > 0 and scores[1]:GetGrade() ~= "Grade_Tier08" then
						if (misses+boos) == 0 then
							if (goods+greats+perfects) == 0 then
								self:setstate(0);
							elseif (goods+greats) == 0 then
								self:setstate(1);
							elseif goods == 0 then
								self:setstate(2);
							else
								self:setstate(3);
							end;
						else
							self:setstate(4);
						end;
						if params.HasFocus then
							self:visible(false);
						else
							self:visible(true);
						end;
					else
						self:setstate(5);
					end;
				else
					local song = params.Song
				--	local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					-- setenv from BGAnimations\ScreenSelectMusic decorations
					local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
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
					local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
					local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
					local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
					local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
					local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
					if bestscore > 0 and topscore:GetGrade() ~= "Grade_Tier08" and topscore:GetGrade() ~= "Grade_Failed" and topscore:GetGrade() ~= "Grade_None" then
						if (misses+boos) == 0 then
							if (goods+greats+perfects) == 0 then
								self:setstate(0);
							elseif (goods+greats) == 0 then
								self:setstate(1);
							elseif goods == 0 then
								self:setstate(2);
							else
								self:setstate(3);
							end;
						else
							self:setstate(4);
						end;
					else
						self:setstate(5);
					end;
				end;
			else
				self:setstate(5);
			end;
		end;
	--	CurrentSongChangedMessageCommand=cmd(queuecommand,"SetMessage");
	--	CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
	--	CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
	--	CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
	--	CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
	--	SetGradeCommand=cmd(queuecommand,"SetMessage");
	};
end;
--]]

--[[
	t[#t+1] = LoadFont("_serpentinedbol 19px")..{
		InitCommand=cmd(pause;zoom,2.9;setstate,5;y,-10);
		SetMessageCommand=function(self,params)
			self:finishtweening();
			local pn = PLAYER_1
			if pn == PLAYER_1 then
				self:x(-40);
			else
				self:x(40);
			end;
			local scores = GetProfileHighScores2(pn,params);
		--	assert(scores);
			if scores ~= false then
				local song = params.Song
				local title = song:GetDisplayMainTitle()
				self:settext(title);
			else
				self:settext("5");
			end;
		end;
	};
--]]
return t;