local c;
local t = LoadFallbackB();
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local mpn = GAMESTATE:GetMasterPlayerNumber();
local GroupNameChange = getenv("GroupNameChange");
local DifficultyMeter = GetUserPref("FirstReMIX_DifficultyMeter");

-- Boss color
local function BossColor(song)
	local steps_hard = song:GetOneSteps(st,"Difficulty_Hard");
	local steps_challenge = song:GetOneSteps(st,"Difficulty_Challenge");
	local meter;
	-- EXPERT
	if steps_hard ~= nil and (steps_hard:GetMeter() == 10 or steps_hard:GetMeter() >= 15) then
		meter = GetConvertDifficulty(song,st,"Difficulty_Hard","ddr","LV100");
		if steps_hard:GetMeter() == 10 and meter >= 22.7 then
			local group = song:GetGroupName();
			local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
			if song:HasStepsTypeAndDifficulty(st,"Difficulty_Challenge") and steps_challenge:GetMeter() >= 11 or GetMeterGroup == "20Meter" then
				return color("#ffffff")
			else
				return color("#ff0000")
			end;
		elseif steps_hard:GetMeter() >= 15 then
			return color("#ff0000")
		--　CHALLENGE
		elseif steps_challenge ~= nil and (steps_challenge:GetMeter() == 10 or steps_challenge:GetMeter() >= 15) then
			meter = GetConvertDifficulty(song,st,"Difficulty_Challenge","ddr","LV100");
			if steps_challenge:GetMeter() == 10 and meter >= 23.3 then -- TWINKLE HEARTが20段階鬼10で最高の23.2000007
				local group = song:GetGroupName();
				local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
				if song:HasStepsTypeAndDifficulty(st,"Difficulty_Hard") and steps_hard:GetMeter() >= 11 or GetMeterGroup == "20Meter" then
					return color("#ffffff")
				else
					return color("#ff0000")
				end;
			elseif steps_challenge:GetMeter() >= 15 then
				return color("#ff0000")
			elseif meter >= 19.2 then -- Am3p-CHAOSが10段階鬼の中で最低数値 19.2000
				local group = song:GetGroupName();
				local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
				if GetMeterGroup ~= "20Meter" then
					return color("#ff0000")
				else
					return color("#ffffff")
				end;
			else
				return color("#ffffff")
			end;
		elseif meter >= 18.7 then -- CHAOSが10段階激の中で最低数値 18.7999
			local group = song:GetGroupName();
			local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
			if GetMeterGroup ~= "20Meter" then
				return color("#ff0000")
			else
				return color("#ffffff")
			end;
		else
			return color("#ffffff")
		end;
	-- CHALLENGE
	elseif steps_challenge ~= nil and (steps_challenge:GetMeter() == 10 or steps_challenge:GetMeter() >= 15) then
		meter = GetConvertDifficulty(song,st,"Difficulty_Challenge","ddr","LV100");
		if steps_challenge:GetMeter() == 10 and meter >= 23.3 then -- TWINKLE HEARTが20段階鬼10で最高の23.2000007
			local group = song:GetGroupName();
			local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
			if song:HasStepsTypeAndDifficulty(st,"Difficulty_Hard") and steps_hard:GetMeter() >= 11 or GetMeterGroup == "20Meter" then
				return color("#ffffff")
			else
				return color("#ff0000")
			end;
		elseif steps_challenge:GetMeter() >= 15 then
			return color("#ff0000")
		elseif meter >= 19.2 then -- Am3p-CHAOSが10段階鬼の中で最低数値 19.2000
			local group = song:GetGroupName();
			local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
			if GetMeterGroup ~= "20Meter" then
				return color("#ff0000")
			else
				return color("#ffffff")
			end;
		else
			return color("#ffffff")
		end;
	else
		return color("#ffffff")
	end;
end
----------------------------------------------------------------------------------strider
if GAMESTATE:IsCourseMode() then
	--　Difficulty back 1p side
	t[#t+1]=LoadActor("explcourse") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};		
end;
--------------------------------------------- radar+difficulty frame strider-------
if not GAMESTATE:IsCourseMode() then
--[[	--　Difficulty back 1p side
	t[#t+1]=LoadActor("1PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;vertalign,center);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	}; ]]--
	------------Player 1 difficulty frame
	t[#t+1]=LoadActor("01_1PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+148;vertalign,bottom;zoomy,0;sleep,0.10;linear,0.25;zoomy,1;);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	t[#t+1]=LoadActor("02_1PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+145;vertalign,top;zoomy,0;sleep,0.10;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	-------------------------------------------------------------------------
--[[	--　Difficulty back 2p side
	t[#t+1]=LoadActor("2PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};]]--
	t[#t+1]=LoadActor("01_2PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
		InitCommand = cmd(x,SCREEN_CENTER_X+431;y,SCREEN_CENTER_Y+148;vertalign,bottom;zoomy,0;sleep,0.10;linear,0.25;zoomy,1;);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	t[#t+1]=LoadActor("02_2PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
		InitCommand = cmd(x,SCREEN_CENTER_X+431;y,SCREEN_CENTER_Y+146;vertalign,top;zoomy,0;sleep,0.10;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	--　BPM back
	t[#t+1]=LoadActor("Back_BPM") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,0.7;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;zoomy,0);
--[[		CurrentSongChangedMessageCommand=function(self)
			local song=GAMESTATE:GetCurrentSong();
			
			self:finishtweening();
			self:diffusealpha(0);
			self:linear(0.2);
			if song then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
		OffCommand=cmd(zoom,0);]]--
	};
--　GRAY BAR 1p side
	t[#t+1]=LoadActor("1PGrayBar") .. {
	 --   Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd();
	--	OffCommand=cmd();	
	};
--　GRAY BAR 2p side
	t[#t+1]=LoadActor("2PGrayBar") .. {
	 --   Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
		InitCommand = cmd();
	--	OffCommand=cmd();	
	};		
end;
--[[
t[#t+1] = Def.ActorFrame {	 		
	LoadActor("1PGrayBar") .. {
	 --   Condition=GAMESTATE:GetCurrentSong():GetDisplayFullTitle() ~= "Tohoku EVOLVED";
	--	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
    };	
};	]]--
------------------------------------------
--------------------------------------------------------------- DIFFICULTY LIST Y POSITION BEETWEEN EACH DIFFICULTY
-- Difficulty List Y Line
-- Base from Default Extended by A.C
local function GetDiffListY(d)
	local r=0;
	local song=GAMESTATE:GetCurrentSong();
	if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
		if d == "Difficulty_Beginner" then
			r=(26*0);
		elseif d == "Difficulty_Easy" then
			r=(26*1);
		elseif d == "Difficulty_Medium" then
			r=(26*2);
		elseif d == "Difficulty_Hard" then
			r=(26*3);
		elseif d == "Difficulty_Challenge" then
			r=(26*4);
		end;
	else
		if d == "Difficulty_Beginner" then
			r=(26*0);
		elseif d == "Difficulty_Easy" then
			r=(26*1);
		elseif d == "Difficulty_Medium" then
			r=(26*2);
		elseif d == "Difficulty_Hard" then
			r=(26*3);
		elseif d == "Difficulty_Challenge" then
			r=(26*4);
		end;
	end;
	return r;
end;

local function GetCourseDiffListY(d)
	local r=0;
	if d == "Difficulty_Easy" then
		r=(-44);
	elseif d == "Difficulty_Medium" then
		r=(0);
	elseif d == "Difficulty_Hard" then
		r=(44);
	else
		r=(0);
	end;
	return r;
end;

-- Difficulty Back Gray Bar
local function DrawDiffBackList(diff)
	return LoadActor("Difficulty_Bar")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;diffusealpha,0;playcommand,"Set");
		SetCommand=function(self)
			local song=GAMESTATE:GetCurrentSong();
			if song then
				if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
					self:y(SCREEN_CENTER_Y+163+GetDiffListY(diff))
				else
					self:y(SCREEN_CENTER_Y+163+GetDiffListY(diff))
				end;
			else
				self:y(SCREEN_CENTER_Y+163+GetDiffListY(diff))
			end
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		OffCommand=cmd(zoom,0);
	};
end;

local function DiffNumber(diff)
	local sd = 0;
	if diff == "Difficulty_Beginner" then
		sd = 1;
	elseif diff == "Difficulty_Easy" then
		sd = 2;
	elseif diff == "Difficulty_Medium" then
		sd = 3;
	elseif diff == "Difficulty_Hard" then
		sd = 4;
	elseif diff == "Difficulty_Challenge" then
		sd = 5;
	end;
	return sd;
end;

local function CursorY(song,diff)
	local y;
	if song:HasStepsTypeAndDifficulty(st,"Difficulty_Challenge") then
		y = SCREEN_CENTER_Y+163+GetDiffListY(diff);
	else
		y = SCREEN_CENTER_Y+163+GetDiffListY(diff);
	end;
	return y;
end;

-- Test
local function GetProfileHighScores2(pn,diff)
	local profile = PROFILEMAN:GetProfile(pn);
	local song = GAMESTATE:GetCurrentSong()
	local steps = song:GetOneSteps( st, diff );
	scorelist = profile:GetHighScoreList(song,steps);
	assert(scorelist);
	local scores = scorelist:GetHighScores();
	assert(scores);
	local bestscore=0;
	if scores[1] then
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
	assert(bestscore);
	return bestscore;
end;
local function GetMachineHighScores2(pn,diff)
	local profile = PROFILEMAN:GetMachineProfile();
	local song = GAMESTATE:GetCurrentSong()
	local steps = song:GetOneSteps( st, diff );
	scorelist = profile:GetHighScoreList(song,steps);
	assert(scorelist);
	local scores = scorelist:GetHighScores();
	assert(scores);
	local topscore=0;
	if scores[1] then
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
	assert(topscore);
	return topscore;
end;

-- Difficulty List
-- Base from Default Extended by A.C
local function DrawDiffList(pn,diff)
	return Def.ActorFrame {
		InitCommand=cmd(hibernate,0.7;playcommand,"Set");
		SetCommand=function(self)
			local song=GAMESTATE:GetCurrentSong();
			if song:HasStepsTypeAndDifficulty(st,"Difficulty_Easy") then
				self:y(SCREEN_CENTER_Y+163+GetDiffListY(diff))
			else
				self:y(SCREEN_CENTER_Y+163+GetDiffListY(diff))
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		OffCommand=cmd(zoom,0);
			
		-- 難易度文字  ---  diffilculty font 1p
		LoadFont("_code bold 24px")..{
			InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-493;zoom,0.7;strokecolor,color("#000000");diffusealpha,0);
			OnCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType()
				self:settextf("%s",THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
								self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
								self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						end;
					else
						self:diffuse(color("#ababab"));
						self:diffusealpha(1);
					end;
				else
					self:diffuse(color("#ababab"));
					self:diffusealpha(0.2);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- 2p
		LoadFont("_code bold 24px")..{
			InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+369;zoom,0.7;strokecolor,color("#000000");playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType()
				self:settextf("%s",THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							    self:diffuse(CustomDifficultyToColor(diff));
								--self:diffuse(color("#a2a2a2"));
							end;
						end;
					else
						self:diffuse(color("#ababab"));
						self:diffusealpha(0.2);
					end;
				else
					self:diffuse(color("#ababab"));
					self:diffusealpha(0.2);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- 譜面自動作成のアイコン
		LoadActor("Autogen")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+84;visible,false;playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song = GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType()
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) and GAMESTATE:GetCurrentSteps(mpn):IsAutogen() then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
								self:diffuse(color("#ababab"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
								self:diffuse(color("#ababab"));
							end;
						end;
						self:visible(true);
					else
						self:visible(false);
						return
					end;
					if song:HasStepsTypeAndDifficulty(st,"Difficulty_Edit") then
						self:y(12);
						self:zoomy(0.7);
					else
						self:y(14);
						self:zoomy(1);
					end;
				else
					self:visible(false)
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- 難易度数字、変換用 1p -------- number
		LoadFont("ScreenSelectMusic DifficultyNumber")..{
			InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-390;y,-4.5;horizalign,right;zoom,0.7;strokecolor,color("#000000");playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType();
				if song then
					local group = song:GetGroupName();
					local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
					
					-- Save DifficultyMeter Group
					if GetMeterGroup ~= "20Meter" then
						if GetMeterGroup == nil then
							if TwentyMeterCheck(song,st) then
								WritePrefToFile("FirstReMIX_DifficultyMeter_"..group,"20Meter");
							else
								WritePrefToFile("FirstReMIX_DifficultyMeter_"..group,"10Meter");
							end;
						elseif TwentyMeterCheck(song,st) and GetMeterGroup == "10Meter" then
							WritePrefToFile("FirstReMIX_DifficultyMeter_"..group,"20Meter");
						end;
					end;
					
					local steps = song:GetOneSteps( st, diff );
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						end;
						if DifficultyMeter == "10Meter" then
							local meter = GetConvertDifficulty(song,st,diff,"test","DDR MAX10");
							if GetMeterGroup == "20Meter" then
								if steps:GetMeter() >= 15 then
									self:settextf("%2i",10);
								elseif steps:GetMeter() < 15 and meter == 10 then
									self:settextf("%2i",9);
								else
									self:settextf("%2i",meter);
								end;
							else
								self:settextf("%2i",steps:GetMeter());
							end;
						elseif DifficultyMeter == "20Meter" then
							local meter = GetConvertDifficulty(song,st,diff,"test","DDR X");
							if GetMeterGroup == "10Meter" then
								if steps:GetMeter() == 10 and meter <= 15 then
									self:settextf("%2i",15);
								elseif steps:GetMeter() < 10 and meter >= 15 then
									self:settextf("%2i",14);
								else
									self:settextf("%2i",meter);
								end;
							else
								if TwentyMeterCheck(song,st) then
									self:settextf("%2i",steps:GetMeter());
								else
									self:settextf("%2i",meter);
								end;
							end;
						else
							self:settextf("%2i",steps:GetMeter());
						end;
					else
						self:diffuse(color("#ababab"));
						self:settext("00");
						self:diffusealpha(0.2);
					end;
				else
					self:diffuse(color("#ababab"));
					self:settext("00");
					self:diffusealpha(0.2);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- 難易度数字、変換用 2p number --
		LoadFont("ScreenSelectMusic DifficultyNumber")..{
			InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+473;y,-4.5;horizalign,right;zoom,0.7;strokecolor,color("#000000");playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType();
				if song then
					local group = song:GetGroupName();
					local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
					
					-- Save DifficultyMeter Group
					if GetMeterGroup ~= "20Meter" then
						if GetMeterGroup == nil then
							if TwentyMeterCheck(song,st) then
								WritePrefToFile("FirstReMIX_DifficultyMeter_"..group,"20Meter");
							else
								WritePrefToFile("FirstReMIX_DifficultyMeter_"..group,"10Meter");
							end;
						elseif TwentyMeterCheck(song,st) and GetMeterGroup == "10Meter" then
							WritePrefToFile("FirstReMIX_DifficultyMeter_"..group,"20Meter");
						end;
					end;
					
					local steps = song:GetOneSteps( st, diff );
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						end;
						if DifficultyMeter == "10Meter" then
							local meter = GetConvertDifficulty(song,st,diff,"test","DDR MAX10");
							if GetMeterGroup == "20Meter" then
								if steps:GetMeter() >= 15 then
									self:settextf("%2i",10);
								elseif steps:GetMeter() < 15 and meter == 10 then
									self:settextf("%2i",9);
								else
									self:settextf("%2i",meter);
								end;
							else
								self:settextf("%2i",steps:GetMeter());
							end;
						elseif DifficultyMeter == "20Meter" then
							local meter = GetConvertDifficulty(song,st,diff,"test","DDR X");
							if GetMeterGroup == "10Meter" then
								if steps:GetMeter() == 10 and meter <= 15 then
									self:settextf("%2i",15);
								elseif steps:GetMeter() < 10 and meter >= 15 then
									self:settextf("%2i",14);
								else
									self:settextf("%2i",meter);
								end;
							else
								if TwentyMeterCheck(song,st) then
									self:settextf("%2i",steps:GetMeter());
								else
									self:settextf("%2i",meter);
								end;
							end;
						else
							self:settextf("%2i",steps:GetMeter());
						end;
					else
						self:diffuse(color("#ababab"));
						self:settext("00");
						self:diffusealpha(0.2);
					end;
				else
					self:diffuse(color("#ababab"));
					self:settext("00");
					self:diffusealpha(0.2);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		
		-- 難易度数字 もと
		--[[
		LoadFont("ScreenSelectMusic DifficultyNumber")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+168+30;y,-4.5;horizalign,right;zoom,0.57;strokecolor,color("#000000");playcommand,"Set");
			SetCommand=function(self)
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType();
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
								self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
								self:diffuse(color("#a2a2a2"));
								if mpn ~= pn then
									self:visible(false);
								end;
							end;
						end;
						local steps = song:GetOneSteps( st, diff );
						self:settextf("%2i",steps:GetMeter());
					else
						self:diffuse(color("#ababab"));
						self:settext("00");
						if mpn == pn then
							self:diffusealpha(0.2);
						else
							self:visible(false);
						end;
					end;
				else
					self:diffuse(color("#ababab"));
					self:settext("00");
					if mpn == pn then
						self:diffusealpha(0.2);
					else
						self:visible(false);
					end;
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		--]]
		-- Footprints ---------- 1p
		LoadActor("tick")..{
			InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-425;diffusealpha,0;zoom,0.8;playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType()
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						end;
					else
						self:diffuse(color("#ababab"));
						self:diffusealpha(0.2);
					end;
				else
					self:diffuse(color("#ababab"));
					self:diffusealpha(0.2);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- Footprints ---------- 2p
		LoadActor("tick")..{
			InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+439;zoom,0.8;diffusealpha,0;playcommand,"Set");
			SetCommand=function(self)
				if pn ~= mpn then return end
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				local style = GAMESTATE:GetCurrentStyle():GetStyleType()
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						if style == "StyleType_OnePlayerOneSide" or style == "StyleType_OnePlayerTwoSides" then
							if diff == GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						else
							if diff == GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() or diff == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
								self:sleep(0.13);
								self:diffuse(CustomDifficultyToColor(diff));
							else
							self:diffuse(CustomDifficultyToColor(diff));
							--	self:diffuse(color("#a2a2a2"));
							end;
						end;
					else
						self:diffuse(color("#ababab"));
						self:diffusealpha(0.2);
					end;
				else
					self:diffuse(color("#ababab"));
					self:diffusealpha(0.2);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- Score
		Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn==PLAYER_1 then
					self:x(SCREEN_CENTER_X-323);
				else
					self:x(SCREEN_CENTER_X+540);
				end;
				(cmd(Load,"RollingNumbersScore";targetnumber,0;y,-3.5;zoom,0.67;strokecolor,color("#000000");visible,false;playcommand,"Set"))(self);
			end;
			SetCommand=function(self)
				if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then return end;
				if not GAMESTATE:IsSideJoined(pn) then return end;
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						local topscore = 0;
						if PROFILEMAN:IsPersistentProfile(pn) then
							topscore = GetProfileHighScores2(pn,diff);
						else
							topscore = GetMachineHighScores2(pn,diff);
						end;
					--	assert(topscore);
						if topscore == 0 then
							self:visible(false)
						else
							self:targetnumber(topscore);
							self:visible(true)
						end;
					else
						self:visible(false)
					end;
				else
					self:visible(false)
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- FullComboRing
		LoadActor("Full_Combo_Mini")..{
			InitCommand=function(self)
				if pn==PLAYER_1 then
					self:x(SCREEN_CENTER_X-560);
				else
					self:x(SCREEN_CENTER_X+300);
				end;
				(cmd(y,-6;visible,false;playcommand,"Set"))(self);
			end;
			SetCommand=function(self)
				if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then return end;
				if not GAMESTATE:IsSideJoined(pn) then return end;
				self:finishtweening();
				local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = song:GetOneSteps( st, diff );
						if PROFILEMAN:IsPersistentProfile(pn) then
							profile = PROFILEMAN:GetProfile(pn);
						else
							profile = PROFILEMAN:GetMachineProfile();
						end;
						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						assert(scores);
						local topscore;
						local bestscore = 0;
						local list = 1;
						if scores[1] then
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
									self:visible(true);
								else
									self:visible(false);
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
				else
					self:visible(false);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		};
		-- Grade-------
		Def.Sprite{
			InitCommand=function(self)
				if pn==PLAYER_1 then
					self:x(SCREEN_CENTER_X-570);
				else
					self:x(SCREEN_CENTER_X+290);
				end;
				(cmd(zoom,0.3;playcommand,"Set"))(self);
			end;
			
			SetCommand=function(self)
				if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then return end;
				if not GAMESTATE:IsSideJoined(pn) then return end;
				self:finishtweening();
				local song=GAMESTATE:GetCurrentSong();
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = song:GetOneSteps( st, diff );
						if PROFILEMAN:IsPersistentProfile(pn) then
							profile = PROFILEMAN:GetProfile(pn);
						else
							profile = PROFILEMAN:GetMachineProfile();
						end;
						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						assert(scores);
						local topgrade;
						local bestscore = 0;
						local list = 1;
						if scores[1] then
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
							if bestscore > 0 then
								self:LoadBackground(THEME:GetPathB("ScreenSelectMusic decorations/Grade/GradeDisplayEval",ToEnumShortString(topgrade)));
								self:visible(true);
							else
								self:visible(false);
							end;
						else
							self:visible(false);
						end;
					else
						self:visible(false);
					end;
				else
					self:visible(false);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		};
	};
end;

if not GAMESTATE:IsCourseMode() then
	t[#t+1]=DrawDiffBackList('Difficulty_Beginner');
	t[#t+1]=DrawDiffBackList('Difficulty_Easy');
	t[#t+1]=DrawDiffBackList('Difficulty_Medium');
	t[#t+1]=DrawDiffBackList('Difficulty_Hard');
	t[#t+1]=DrawDiffBackList('Difficulty_Challenge');
	t[#t+1]=DrawDiffBackList('Difficulty_Edit');
	-- Cursor
	t[#t+1]=Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X);
		OffCommand=cmd(zoom,0);

		-- 1P Cursor
		LoadActor("Cursor/1P") .. {
			InitCommand = cmd(hibernate,0.7;y,-20;x,-431;visible,false);
			CurrentStepsP1ChangedMessageCommand=function(self)
				self:finishtweening();
				self:visible(true);
				local song=GAMESTATE:GetCurrentSong();
				local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
				self:y(CursorY(song,diff))
				local getsavediff = getenv("SaveDifficulty1P");
				if getsavediff ~= nil then
					local zd = (getsavediff - DiffNumber(diff));
					if song:HasStepsTypeAndDifficulty(st,"Difficulty_Edit") then
						self:addy(23*zd);
						self:linear(0.15);
						self:addy(-23*zd);
					else
						self:addy(26.5*zd);
						self:linear(0.15);
						self:addy(-26.5*zd);
					end;
				end;
				self:queuecommand("Save");
			end;
			SaveCommand=function(self)
				local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
				setenv("SaveDifficulty1P",DiffNumber(diff));
			end;
		};
		-- 2P Cursor
		LoadActor("Cursor/2P") .. {
			InitCommand = cmd(hibernate,0.7;y,-20;x,431;visible,false);
			CurrentStepsP2ChangedMessageCommand=function(self)
				self:finishtweening();
				self:visible(true);
				local song=GAMESTATE:GetCurrentSong();
				local diff = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
				self:y(CursorY(song,diff))
				local getsavediff = getenv("SaveDifficulty2P");
				if getsavediff ~= nil then
					local zd = (getsavediff - DiffNumber(diff));
					if song:HasStepsTypeAndDifficulty(st,"Difficulty_Edit") then
						self:addy(23*zd);
						self:linear(0.15);
						self:addy(-23*zd);
					else
						self:addy(26.5*zd);
						self:linear(0.15);
						self:addy(-26.5*zd);
					end;
				end;
				self:queuecommand("Save");
			end;
			SaveCommand=function(self)
				local diff = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
				setenv("SaveDifficulty2P",DiffNumber(diff));
			end;
		};
	};
	for pn in ivalues(PlayerNumber) do
		t[#t+1]=DrawDiffList(pn,'Difficulty_Beginner');
		t[#t+1]=DrawDiffList(pn,'Difficulty_Easy');
		t[#t+1]=DrawDiffList(pn,'Difficulty_Medium');
		t[#t+1]=DrawDiffList(pn,'Difficulty_Hard');
		t[#t+1]=DrawDiffList(pn,'Difficulty_Challenge');		
	end;
	t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar", "GrooveRadar");
	t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
	t[#t+1] = StandardDecorationFromFileOptional("SongTime","SongTime") .. {
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				local length = song:MusicLengthSeconds();
				self:settext( SecondsToMSS(length) );
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	}
	------------------title back ----------------
t[#t+1]=LoadActor("Title_Back") .. {
	InitCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:x(SCREEN_CENTER_X-160);
		else
			self:x(SCREEN_CENTER_X);
		end;
	(cmd(y,SCREEN_CENTER_Y;))(self)
	end;
	OnCommand=cmd(zoomx,0;sleep,0.1;linear,0.15;zoomx,1.3;linear,0.15;zoomx,1);
--[[	CurrentSongChangedMessageCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:diffuse(color("#ffffff"));
		else
			local song=GAMESTATE:GetCurrentSong();
			self:finishtweening();
			
			if song then
				self:diffuse(color("#ffffffff")); ]]--
				--[[
				if song:IsLong() or song:IsMarathon() then
					self:diffuse(color("#ff6666dd"));
				else
					self:diffuse(color("#ffffffdd"));
				end;
				--]]
--[[			--	self:diffuse(color("#000000dd"));
			else
				local groupname = getenv("GetGroupName");
			--	if groupname == "" or groupname == "DIFFICULTY" then
				if groupname == "RANDOM" then
				--	self:diffuse(color("#56d4fe"));
				--	self:diffuse(color("#99ffacdd"));
				--	self:diffuse(color("#72ffacdd"));
					self:diffuse(color("#4fffacdd"));
				--	self:diffuse(color("#6effbbdd"));
				else
				--	self:diffuse(color("#ffcb55dd"));
				--	self:diffuse(color("#efda65dd"));
				--	self:diffuse(color("#ffda65dd"));
					self:diffuse(color("#ffda46dd"));
				--	self:diffuse(color("#ffdf60dd"));
				end;
			end;
		end;
	end;]]--
	-- Fix use random
--	Oncommand=cmd(zoomx,0;sleep,0.2;linear,0.2;zoomx,1.2;linear,0.1;zoomx,1);
	OffCommand=cmd(linear,0.25;zoomx,0);
};
-----------FOLDER-------title back ----------------
t[#t+1]=LoadActor("FolderTitle_Back") .. {
	InitCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:x(SCREEN_CENTER_X-160);
		else
			self:x(SCREEN_CENTER_X);
		end;
	(cmd(y,SCREEN_CENTER_Y;))(self)
	end;
	OnCommand=cmd(zoomx,0;sleep,0.1;linear,0.15;zoomx,1.3;linear,0.15;zoomx,1);
	CurrentSongChangedMessageCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:diffusealpha(0);
		else
			local song=GAMESTATE:GetCurrentSong();
			self:finishtweening();
			
			if song then
				self:diffusealpha(0);
			else
				local groupname = getenv("GetGroupName");
				if groupname == "RANDOM" then
					self:diffusealpha(1);
				else
					self:diffusealpha(1);

				end;
			end;
		end;
	end;
	OffCommand=cmd(linear,0.25;zoomx,0);
};
---------------------------------------------
	t[#t+1] = LoadActor("StageDisplay") .. {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X+247,SCREEN_CENTER_X+146);y,WideScale(SCREEN_CENTER_Y-185,SCREEN_CENTER_Y-213));
		OffCommand=cmd(linear,0.25;addy,-74);
	};
	-- Center SongTitle
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(self) c = self:GetChildren(); end;
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+90;diffuse,color("#000000"));
		OffCommand=cmd(diffusealpha,0);
		-- Title
		LoadFont("_mangal 24px")..{
			Name="Title";
			InitCommand=cmd(y,15;maxwidth,400;diffusealpha,0;sleep,0.7;linear,0.25;diffusealpha,1;);
		};
		--[[
		-- Difficulty check Hard
		LoadFont("_russellsquare Bold")..{
			InitCommand=cmd(horizalign,left;x,-150-65;y,33-10-18-150;zoom,1.45;maxwidth,400;playcommand,"Set";strokecolor,color("#ff0000"));
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				if song:HasStepsTypeAndDifficulty(st,"Difficulty_Hard") then
					local steps = song:GetOneSteps(st,"Difficulty_Hard");
					local meter=GetConvertDifficulty(song,st,"Difficulty_Hard","ddr","LV100");
					self:settext(meter);
					self:strokecolor(BossColor(song));
				else
					self:settext("");
				end;
			end;
		};
		-- Difficulty check Challenge
		LoadFont("_russellsquare Bold")..{
			InitCommand=cmd(horizalign,left;x,-150-65;y,33+10-150;zoom,1.45;maxwidth,400;playcommand,"Set";strokecolor,color("#ff0000"));
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				if song:HasStepsTypeAndDifficulty(st,"Difficulty_Challenge") then
					local steps2 = song:GetOneSteps(st,"Difficulty_Challenge");
					local meter=GetConvertDifficulty(song,st,"Difficulty_Challenge","ddr","LV100");
					self:settext(meter);
					self:strokecolor(BossColor(song));
				else
					self:settext("");
				end;
			end;
		};
		--]]
		-- SubTitle		
		LoadFont("_code bold 24px")..{
			Name="SubTitle";
			InitCommand=cmd(y,24;zoomx,0.57;zoomy,0.45;maxwidth,582;diffusealpha,0;sleep,0.7;linear,0.25;diffusealpha,1;);
		};
		-- Artist		
		LoadFont("_code bold 24px")..{
			Name="Artist";
			InitCommand=cmd(y,39;zoomx,0.8;zoomy,0.8;maxwidth,562;diffusealpha,0;sleep,0.7;linear,0.25;diffusealpha,1;);
		};
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				local bosscolor = BossColor(song);
				local title;
				if song:GetDisplaySubTitle() == "" then
					title = song:GetDisplayMainTitle();
					c.Title:y(15);
					c.SubTitle:visible(false)
				else
					title = song:GetDisplayMainTitle();
					c.Title:y(12);
					
					local Subtitle = song:GetDisplaySubTitle();
					c.SubTitle:y(24);
					c.SubTitle:settext(Subtitle);
			--		c.SubTitle:strokecolor(color("#ffffff"));
					c.SubTitle:strokecolor(bosscolor);
					c.SubTitle:visible(true);
				end;
		--		c.Title:strokecolor(color("#ffffff"));
				c.Title:strokecolor(bosscolor);
				c.Title:settext(title);
				local artist;
				if song:GetDisplayArtist() == "Unknown artist" or song:GetDisplayArtist() == "♪♪♪♪♪" then
					c.Artist:visible(false)
					return
				elseif song:GetDisplaySubTitle() == "" then
					artist = song:GetDisplayArtist();
					c.Artist:y(39);
				else
					artist = song:GetDisplayArtist();
					c.Artist:y(39);
				end;
				c.Artist:settext(artist);
		--		c.Artist:strokecolor(color("#ffffff"));
				c.Artist:strokecolor(BossColor(song));
				c.Artist:visible(true);
			else
				local groupname = getenv("GetGroupName");
				if GroupNameChange then
					title = ChangeGroupName(groupname)
				else
					title = groupname;
				end;
				--[[
				if groupname == "" or groupname == "DIFFICULTY" then
					title = "RANDOM";
				elseif GroupNameChange then
					title = ChangeGroupName(groupname)
				else
					title = groupname;
				end;
				--]]
			--	c.Title:y(15+6);
				c.Title:y(15);
				c.Title:strokecolor(color("#ffffff"));
				c.Title:settext(title);
				c.SubTitle:visible(false)
				c.Artist:visible(false)
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};
	-- Option icon 1P
	t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;draworder,100;x,SCREEN_CENTER_X-417;y,SCREEN_CENTER_Y+299;zoomx,2;zoomy,1.5;addy,200;sleep,0.5;linear,0.5;addy,-200);
		OffCommand=cmd(linear,0.25;addy,200);
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
			end;
		end;
	};
	-- Option icon 2P
	t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
		InitCommand=cmd(player,PLAYER_2;zoomx,2;zoomy,1.5;draworder,100;x,SCREEN_CENTER_X+445;y,SCREEN_CENTER_Y+299;addy,200;sleep,0.5;linear,0.5;addy,-200);
		OffCommand=cmd(linear,0.25;addy,200);
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:visible(true);
			end;
		end;
	};
	-- ShockArrow mark 1P
	t[#t+1] = LoadActor( "_ShockArrow_mark 1P 8x1" ) .. {
		InitCommand=cmd(draworder,100;x,SCREEN_CENTER_X-112;y,SCREEN_CENTER_Y+75;zoom,1;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.85,0.85,0.85,1;effectperiod,0.25;playcommand,"Set");
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			local yZoom = 0
			if song then
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
				if steps then
					if steps:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Mines') == 0 then
						yZoom = 0
					else
						yZoom = 1
					end
				else
					yZoom = 0
				end
			else
				yZoom = 0
			end
			self:finishtweening()
			self:decelerate(0.15)
			self:zoomy(yZoom)
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		OffCommand=cmd(decelerate,0.25;zoomy,0);
	};
	-- ShockArrow mark 2P
	t[#t+1] = LoadActor( "_ShockArrow_mark 2P 8x1" ) .. {
		InitCommand=cmd(draworder,100;x,SCREEN_CENTER_X+112;y,SCREEN_CENTER_Y-75;zoom,1;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.85,0.85,0.85,1;effectperiod,0.25;playcommand,"Set");
		SetCommand=function(self)
			local yZoom = 0
			if GAMESTATE:GetCurrentSong() then
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
				if steps then
					if steps:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Mines') == 0 then
						yZoom = 0
					else
						yZoom = 1
					end
				else
					yZoom = 0
				end
			else
				yZoom = 0
			end
			self:finishtweening()
			self:decelerate(0.1)
			self:zoomy(yZoom)
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		OffCommand=cmd(decelerate,0.25;zoomy,0);
	};
	-- SortModeMenu help text
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-27);
		LoadFont("Common Normal")..{
			Text=THEME:GetString(Var "LoadingScreen","ModeMenuHelpText");
			InitCommand=cmd(x,1;y,1;zoomx,0.68;zoomy,WideScale(0.58,0.51);diffuse,color("#000000");strokecolor,color("#000000");maxwidth,WideScale(920,1227);diffusealpha,0);
			SortOrderChangedMessageCommand=function(self)
				self:finishtweening()
				local alpha = 0
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_ModeMenu" then
					alpha = 1
					self:sleep(0.25)
				else
					alpha = 0
				end;
				self:decelerate(0.25)
				self:diffusealpha(alpha)
			end;
		};
		LoadFont("Common Normal")..{
			Text=THEME:GetString(Var "LoadingScreen","ModeMenuHelpText");
			InitCommand=cmd(zoomx,0.68;zoomy,WideScale(0.58,0.51);strokecolor,color("#000000");maxwidth,WideScale(920,1227);diffusealpha,0);
			SortOrderChangedMessageCommand=function(self)
				self:finishtweening()
				local alpha = 0
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_ModeMenu" then
					alpha = 1
					self:sleep(0.25)
				else
					alpha = 0
				end;
				self:decelerate(0.25)
				self:diffusealpha(alpha)
			end;
		};
	};
	-- For MusicWheel grades
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		t[#t+1] = Def.Actor{
			SetCommand=function(self)
				local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
				setenv("GetDifficulty"..ToEnumShortString(pn),diff)
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
	end;
end;

if GAMESTATE:IsCourseMode() then
	t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList");
	-- Course name
	t[#t+1] = LoadFont("common normal")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y;zoomx,1;zoomy,1;maxwidth,WideScale(370,400);diffuse,color("#000000");strokecolor,color("#ffffff"));
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse();
			if course then
				if course:GetGroupName() == "" or course:GetGroupName() == "Default" then
					self:y(SCREEN_CENTER_Y+115);
				else
					self:y(SCREEN_CENTER_Y+115);
				end;
				if GroupNameChange then
					self:settext(ChangeGroupName(course:GetDisplayFullTitle()));
				else
					self:settext(course:GetDisplayFullTitle());
				end;
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		OffCommand=cmd(diffusealpha,1;linear,0.25;diffusealpha,0);
	};
	-- Course Group name
	t[#t+1] = LoadFont("_futura std medium 20px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+31;zoomx,0.59;zoomy,0.47;maxwidth,WideScale(520,561);diffuse,color("#000000");strokecolor,color("#ffffff"));
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse();
			if course then
				if course:GetGroupName() == "Default" then return self:settext("") end;
				if GroupNameChange then
					self:settext(ChangeGroupName(course:GetGroupName()));
				else
					self:settext(course:GetGroupName());
				end;
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		OffCommand=cmd(diffusealpha,1;linear,0.25;diffusealpha,0);
	};
	-- Course Difficulty List Text
	t[#t+1] = Def.ActorFrame{
		LoadActor( "CourseDifficulty_Bar_Back" ) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+170);
			SetCommand=function(self)
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				if diff == "Difficulty_Easy" then
					self:diffuseshift();
					self:effectcolor1(color("#ffffff"));
					self:effectcolor2(color("#dddddd"));
					self:effectperiod(0.33);
				else
					self:diffuseshift();
					self:effectcolor1(color("#666666"));
					self:effectcolor2(color("#666666"));
				end;
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		LoadActor( "CourseDifficulty_Bar_Basic" ) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+170);
			SetCommand=function(self)
				self:finishtweening();
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				if diff == "Difficulty_Easy" then
					self:sleep(0.13);
					self:diffuse(color("#ffffff"));
				else
					self:diffuse(color("#666666"));
				end;
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		LoadActor( "CourseDifficulty_Bar_Back" ) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+210);
			SetCommand=function(self)
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				if diff == "Difficulty_Medium" then
					self:diffuseshift();
					self:effectcolor1(color("#ffffff"));
					self:effectcolor2(color("#dddddd"));
					self:effectperiod(0.33);
				else
					self:diffuseshift();
					self:effectcolor1(color("#666666"));
					self:effectcolor2(color("#666666"));
				end;
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		LoadActor( "CourseDifficulty_Bar_Difficult" ) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+210);
			SetCommand=function(self)
				self:finishtweening();
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				if diff == "Difficulty_Medium" then
					self:sleep(0.13);
					self:diffuse(color("#ffffff"));
				else
					self:diffuse(color("#666666"));
				end;
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		LoadActor( "CourseDifficulty_Bar_Back" ) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+250);
			SetCommand=function(self)
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				if diff == "Difficulty_Hard" then
					self:diffuseshift();
					self:effectcolor1(color("#ffffff"));
					self:effectcolor2(color("#dddddd"));
					self:effectperiod(0.33);
				else
					self:diffuseshift();
					self:effectcolor1(color("#666666"));
					self:effectcolor2(color("#666666"));
				end;
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		LoadActor( "CourseDifficulty_Bar_Expert" ) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+250);
			SetCommand=function(self)
				self:finishtweening();
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				if diff == "Difficulty_Hard" then
					self:sleep(0.13);
					self:diffuse(color("#ffffff"));
				else
					self:diffuse(color("#666666"));
				end;
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		--[[
		
		-- 1P circle
		LoadActor("../ScreenGameplay overlay/1P.lua")..{
			InitCommand = cmd(player,PLAYER_1;x,SCREEN_CENTER_X-320-126;effectclock,"beat";playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=function(self)
				self:finishtweening();
				self:visible(true);
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				self:y(SCREEN_CENTER_Y+210+GetCourseDiffListY(diff))
				local getsavediff = getenv("SaveCourseDifficulty");
				if getsavediff ~= nil then
					local zd = (getsavediff - DiffNumber(diff));
					self:addy(44*zd);
					self:linear(0.15);
					self:addy(-44*zd);
				end;
				self:queuecommand("Save");
			end;
			SaveCommand=function(self)
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				setenv("SaveCourseDifficulty",DiffNumber(diff));
			end;
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		};
		-- 2P circle
		LoadActor("../ScreenGameplay overlay/2P.lua")..{
			InitCommand = cmd(player,PLAYER_2;x,SCREEN_CENTER_X-320+126;effectclock,"beat");
			CurrentTrailP2ChangedMessageCommand=function(self)
				self:finishtweening();
				self:visible(true);
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				self:y(SCREEN_CENTER_Y+210+GetCourseDiffListY(diff))
				local getsavediff = getenv("SaveCourseDifficulty");
				if getsavediff ~= nil then
					local zd = (getsavediff - DiffNumber(diff));
					self:addy(44*zd);
					self:linear(0.15);
					self:addy(-44*zd);
				end;
				self:queuecommand("Save");
			end;
			SaveCommand=function(self)
				local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
				setenv("SaveCourseDifficulty",DiffNumber(diff));
			end;
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		}; ]]--
	};
	-- Song stage
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y-200);
		-- Under blue text
		LoadFont("_futura std medium 20px")..{
			InitCommand=cmd(diffuse,color("#000000");strokecolor,color("#ffffff");zoom,1.33;uppercase,true;);
			OffCommand=cmd(linear,0.25;diffusealpha,0);
			SetCommand=function(self)
				local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
				local stageText;
				if coursestages == 1 then
					stageText = "1 STAGE";
				else
					stageText = coursestages.." STAGES";
				end;
				self:settext(stageText);
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
		-- Over red text
		LoadFont("_futura std medium 20px")..{
			InitCommand=cmd(y,-25;diffuse,color("#e02820");strokecolor,color("#ffffff");zoom,0.85;uppercase,true;maxwidth,WideScale(190,250));
			OffCommand=cmd(linear,0.25;diffusealpha,0);
			SetCommand=function(self)
				local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
				local stageText;
				if coursestages == 1 then
					stageText = "";
				else
					stageText ="Enjoy number of stages!";
				end;
				self:settext(stageText);
			end;
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
	};
end;

return t