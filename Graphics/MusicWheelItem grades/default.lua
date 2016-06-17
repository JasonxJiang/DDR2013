-- This actor is duplicated.  Upvalues will not be duplicated.
local t = Def.ActorFrame {}
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

local grades = {
	Grade_Tier01 = 0;
	Grade_Tier02 = 1;
	Grade_Tier03 = 2;
	Grade_Tier04 = 3;
	Grade_Tier05 = 4;
	Grade_Tier06 = 4;
	Grade_Tier07 = 4;
	Grade_Tier08 = 5;
	Grade_Failed = 5;
	Grade_None = 5;
};

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

-- BestScore List 2
--[[
local function GetProfileHighScores2(pn,params)
	local profile = PROFILEMAN:GetProfile(pn);
	if GAMESTATE:IsCourseMode() then
		local course = params.Course;
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = params.Song
		local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
	return scorelist:GetHighScores();
end;
--]]
local function GetProfileHighScores2(pn,params)
	local profile = PROFILEMAN:GetProfile(pn);
	if GAMESTATE:IsCourseMode() then
		local course = params.Course;
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
		assert(scorelist);
	else
		local song = params.Song
		local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
		if song:HasStepsTypeAndDifficulty(st,diff) then
			local steps = song:GetOneSteps( st, diff );
			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
		else
			return nil;
		end;
	end;
	return scorelist:GetHighScores();
end; 

-- TopScore List 2
local function GetMachineHighScores2(pn,params)
	local profile = PROFILEMAN:GetMachineProfile();
	if GAMESTATE:IsCourseMode() then
		local course = params.Course;
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
		assert(scorelist);
	else
		local song = params.Song
		local diff = getenv("GetDifficulty"..ToEnumShortString(pn))	
		if song:HasStepsTypeAndDifficulty(st,diff) then
			local steps = song:GetOneSteps( st, diff );
			scorelist = profile:GetHighScoreList(song,steps);
			assert(scorelist);
		else
			return nil;
		end;
	end;
	return scorelist:GetHighScores();
end;

local bsong;
local b2song;

-- FullCombo label center
t[#t+1] = LoadActor("FullCombo") .. {
	InitCommand=cmd(pause;zoom,1.1;y,67);
	SetGradeCommand=function(self,params)
		if params.Grade == 'Grade_Tier08' or params.Grade == 'Grade_Failed' or params.Grade == 'Grade_None' then return self:setstate(5) end;
		local pn = params.PlayerNumber;
		if pn == PLAYER_1 then
			self:x(-50);
		else
			self:x(-35);
		end;
		local scores;
		if PROFILEMAN:IsPersistentProfile(pn) then
			scores = GetProfileHighScores(pn);
		else
			scores = GetMachineHighScores(pn);
		end;
	--	local scores = GetProfileHighScores(pn);
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
				if topscore:GetScore() > 0 then
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
				local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
				local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
				local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
				local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
				local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
				if bestscore > 0 then
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
	SetMessageCommand=function(self,params)
		if params.HasFocus then
			-- 無駄な動作コマンドを入れておくと、ホイールを回したときに生ずる一瞬のズレが回避される
			self:linear(0);
			self:diffusealpha(1);
		else
			self:diffusealpha(0);
		end;
	end;
};

-- FullCombo label side
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo") .. {
		InitCommand=cmd(pause;zoom,1;setstate,5;y,67);
		SetMessageCommand=function(self,params)
			if params.HasFocus then self:linear(0) self:diffusealpha(0) return end;
			self:diffusealpha(1)
			if pn == PLAYER_1 then
				self:x(-50);
			else
				self:x(-35);
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
			if scores ~= nil and scores[1] then
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

	

--[[
t[#t+1] = LoadFont("_serpentinedbol 19px")..{
	InitCommand=cmd(pause;zoom,2.9;setstate,5;y,-10);
	SetMessageCommand=function(self,params)
		self:diffusealpha(1)
		local pn = PLAYER_1
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
		if scores ~= nil and scores[1] then
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
				
				local title = song:GetDisplayMainTitle()
			--	local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
				-- setenv from BGAnimations\ScreenSelectMusic decorations
				
				local diff = getenv("GetDifficulty"..ToEnumShortString(pn))
				
				if song:HasStepsTypeAndDifficulty(st,diff) then
				
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

					self:settext(title);
				else
					self:settext("5");
				end;
			end;
		else
			self:settext("5");
		end;
	--	self:settext(drawIndex);
	end;
};
--]]

-- local title;
t[#t+1] = Def.ActorFrame{
	-- Label
	--[[
	LoadActor("grades") .. {
		InitCommand=cmd(pause;zoom,0.9);
		SetGradeCommand=function(self,params)
			local state = grades[params.Grade];
			if state then
				self:setstate(state);
				self:visible(true);
				local player = params.PlayerNumber;
				if player == PLAYER_1 then
					self:x(-40);
				else
					self:x(40);
				end;
			else
				self:visible(false);
			end;
		end;
	};
	--]]
	LoadActor(THEME:GetPathG("MusicWheelItem","Song NormalPart/WheelNotifyIcon"))..{
		InitCommand=cmd(zoom,1;y,2.5);
		SetCommand=function(self,params)
			if GAMESTATE:GetSortOrder() ~= 'SortOrder_Popularity' then return self:visible(false) end;
			if params.Index > 2 then
				self:visible(false);
			else
				self:visible(true);
				if params.HasFocus then
					self:x(-90);
				else
					self:x(0);
				end;
			end;
		end;
	};
	LoadFont("_serpentinedbol 19px")..{
		InitCommand=cmd(diffuse,color("#fff90a");zoom,1.22;y,2.5);
		SetCommand=function(self,params)
			if GAMESTATE:GetSortOrder() ~= 'SortOrder_Popularity' then return self:visible(false) end;
			if params.Index == 0 or params.Index == 1 or params.Index == 2 then
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
				end;
				if params.HasFocus then
					self:x(-90);
				else
					self:x(0);
				end;
			else
				self:visible(false);
			end;
		end;
	};
	

	
	--[[
	-- P1
	LoadActor("FullCombo") .. {
		InitCommand=cmd(pause;zoom,0.9;visible,false);
		SetMessageCommand=function(self,params)
			if not GAMESTATE:IsPlayerEnabled(PLAYER_1) then return end;
			local pn = PLAYER_1;
			self:x(-40);
				
			local scores = GetProfileHighScores2(pn,params);
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
						if params.HasFocus then
							self:visible(false);
						else
							self:visible(true);
						end;
					else
						self:setstate(5);
					end;
				end;
			else
				self:setstate(5);
			end;
		end;
	};
	
	-- P2
	LoadActor("FullCombo") .. {
		InitCommand=cmd(pause;zoom,0.9;visible,false);
		SetMessageCommand=function(self,params)
			if not GAMESTATE:IsPlayerEnabled(PLAYER_2) then return end;
			local pn = PLAYER_2;
			self:x(40);
				
			local scores = GetProfileHighScores2(pn,params);
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
						if params.HasFocus then
							self:visible(false);
						else
							self:visible(true);
						end;
					else
						self:setstate(5);
					end;
				end;
			else
				self:setstate(5);
			end;
		end;
	};
	--]]
	--[[
	LoadFont("_serpentinedbol 19px")..{
		InitCommand=cmd(diffuse,color("#fff90a");zoom,1.22;y,-22.5);
		SetGradeCommand=function(self,params)
			
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			local diff3 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetFilename()
			local diff2 = GAMESTATE:GetCurrentSong():GetDisplayMainTitle()
			
			bsong = diff
			self:queuecommand("Test");
		--	self:settext(diff);
		end;
		TestCommand=function(self,params)
			self:settext(bsong);
		end;
		SetMessageCommand=function(self,params)
			
		--	local course = params.Course;
			local song = params.Song;
			local title = song:GetDisplayFullTitle();
			
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			local diff3 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetFilename()
			local diff2 = GAMESTATE:GetCurrentSong():GetDisplayMainTitle()
			self:settext(bsong);
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		SetGradeCommand=cmd(queuecommand,"SetMessage");
	};
	--]]
	
	--[[
	-- FullCombo test
	LoadActor("grades") .. {
		InitCommand=cmd(pause);
		SetGradeCommand=function(self, params)
			local state = grades[params.Grade];
			if state then
				self:setstate(state);
				self:visible(true);
			else
				self:visible(false);
			end;
			local playernumber = params.PlayerNumber;
			local diff = GAMESTATE:GetCurrentSteps(params.PlayerNumber):GetDifficulty();
			setenv("GetDifficulty",diff)
			setenv("GetPlayerNumber",playernumber)
		end;
		SetMessageCommand=function(self,params)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			local song = params.Song;
			local steps = song:GetOneSteps( st, getenv("GetDifficulty") );
			if PROFILEMAN:IsPersistentProfile(getenv("GetPlayerNumber")) then
				-- player profile
				profile = PROFILEMAN:GetProfile(getenv("GetPlayerNumber"));
			else
				-- machine profile
				profile = PROFILEMAN:GetMachineProfile();
			end;
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
					self:diffusealpha(1);
				else
					self:diffusealpha(0);
				end;
			else
				self:diffusealpha(0);
			end;
		end;
	};
	--]]
	
	
	--[[
	LoadFont("_serpentinedbol 19px") .. {
		InitCommand=cmd(zoom,1;playcommand,"SetMessage");
		SetMessageCommand=function(self,params)
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			if params.Song then
				song = params.Song
			end;
			title = song:GetDisplayMainTitle();
			self:settext(diff);
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
	--	SetGradeCommand=cmd(queuecommand,"SetMessage");
		SetGradeCommand=function(self,params)
			local st = GAMESTATE:GetCurrentStyle():GetStepsType();
			local diff = GAMESTATE:GetCurrentSteps(params.PlayerNumber):GetDifficulty()
			local diff3 = GAMESTATE:GetCurrentSteps(params.PlayerNumber):GetFilename()
			local diff2 = GAMESTATE:GetCurrentSong():GetDisplayMainTitle()
			self:settext(diff);
		--	local song=GAMESTATE:GetCurrentSong();
		--	local title = song:GetDisplayMainTitle();
		--	self:settext(title);
		end;
	};
	--]]
	--[[
	-- FullCombo ring mini test
	-- params.songが取れないとダメ
	LoadActor(THEME:GetPathB("ScreenEvaluation","underlay/FullCombo")) .. {
		InitCommand=cmd(zoom,0.5);
		SetGradeCommand=function(self,params)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			local song=GAMESTATE:GetCurrentSong();
			local diff = GAMESTATE:GetCurrentSteps(params.PlayerNumber):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );
			if PROFILEMAN:IsPersistentProfile(params.PlayerNumber) then
				-- player profile
				profile = PROFILEMAN:GetProfile(params.PlayerNumber);
			else
				-- machine profile
				profile = PROFILEMAN:GetMachineProfile();
			end;
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
					self:diffusealpha(1);
				else
					self:diffusealpha(0);
				end;
			else
				self:diffusealpha(0);
			end;
		end;
	};
	--]]	
	
	--[[
	-- Difficulty text
	LoadFont("_serpentinedbol 19px") .. {
		InitCommand=cmd(zoom,1);
		SetGradeCommand=function(self, params)
			local st = GAMESTATE:GetCurrentStyle():GetStepsType();
			local diff = GAMESTATE:GetCurrentSteps(params.PlayerNumber):GetDifficulty()
			self:settext(diff);
		--	local song=GAMESTATE:GetCurrentSong();
		--	local title = song:GetDisplayMainTitle();
		--	self:settext(title);
		end;
	};
	--]]

};

--[[
t[#t+1] = Def.ActorFrame {

	LoadFont("_serpentinedbol 19px")..{
		Name="AliveTime";
		InitCommand=cmd(diffuse,color("#fff90a");zoom,1.22;y,-10);
		SetGradeCommand=function(self,params)
			
			local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			local diff3 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetFilename()
			local diff2 = GAMESTATE:GetCurrentSong():GetDisplayMainTitle()
			
			bsong = diff
			self:queuecommand("Test");
		--	self:settext(diff);
		end;
		TestCommand=function(self,params)
			self:settext(bsong);
		end;
		SetMessageCommand=function(self,params)
			
		--	local course = params.Course;
			local song = params.Song;
			local title = song:GetDisplayFullTitle();
			
		--	local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
			self:settext(title);
		--	self:settext(title);
		--	self:SetUpdateFunction( Update );
		end;
	};
};
--]]
--[[
local function Update(self)
	local AliveTime = self:GetChild("AliveTime");
	local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
--	AliveTime:settext(diff);
	c.AliveTime:queuecommand("SetMessage");
end;
t.InitCommand=cmd(SetUpdateFunction,Update);
--]]

return t;