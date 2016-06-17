-- Scripts/99 cnvMeterType.lua from waiei by A.C

local st=GAMESTATE:GetCurrentStyle():GetStepsType();
local mpn = GAMESTATE:GetMasterPlayerNumber();

local grades = {
	Grade_Tier01 = true;
	Grade_Tier02 = true;
	Grade_Tier03 = true;
	Grade_Tier04 = true;
	Grade_Tier05 = true;
	Grade_Tier06 = true;
	Grade_Tier07 = true;
	Grade_Tier08 = false;
	Grade_Failed = false;
	Grade_None = false;
};

local GetDiffMeter = GetUserPref("FirstReMIX_DifficultyMeter");
local function bar()
	if GetDiffMeter == "10Meter" then
		return THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_bar_10");
	elseif GetDiffMeter == "20Meter" then
		return THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_bar_20");
	else
		return THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_bar_normal");
	end;
end;
local bbar = bar();

return Def.ActorFrame { 
	-- White big back
	LoadActor("CourseEntryDisplay_Back") .. {
		InitCommand=cmd();
	};
	-- 2 grey back
	LoadActor(bbar) .. {
		InitCommand=cmd(y,-91.5);
		SetCommand=function(self)
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
			if coursestages < 7 then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	};
	-- 3 grey back
	LoadActor(bbar) .. {
		InitCommand=cmd(y,-30.5);
		SetCommand=function(self)
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
			if coursestages < 7 then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	};
	-- 4 grey back
	LoadActor(bbar) .. {
		InitCommand=cmd(y,30.5);
		SetCommand=function(self)
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
			if coursestages < 7 then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	};
	-- 5 grey back
	LoadActor(bbar) .. {
		InitCommand=cmd(y,91.5);
		SetCommand=function(self)
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
			if coursestages < 7 then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	};
	-- 6 grey back
	LoadActor(bbar) .. {
		InitCommand=cmd(y,152.5);
		SetCommand=function(self)
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
			if coursestages < 7 then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	};

	Def.CourseContentsList {
		MaxSongs = 100;
		NumItemsToDraw = 7;

		InitCommand=cmd();
		-- Base from CyberiaStyle 7 by gl_yukt
		SetCommand=function(self)
			self:finishtweening();
			self:PositionItems();
			self:SetFromGameState();
			self:SetTransformFromHeight(61);
		--	self:SetDestinationItem( self:GetNumItems()-2 );
			self:SetMask(400,117);
			local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
			if coursestages < 7 or coursestages == nil then
				self:SetCurrentAndDestinationItem(2.5);
				self:SetLoop(false);
				self:stoptweening();
			else
				self:SetLoop(true);
				self:scrollthroughallitems();
				self:queuecommand("Sleep");
			end;
		end;
		
		SleepCommand = function(self)
			self:SetCurrentAndDestinationItem(2.5);
			self:sleep(1.5);
			self:queuecommand("Scroll");
		end;
		
		ScrollCommand = function(self)
			self:setsecondsperitem(1);
			self:SetDestinationItem(self:GetNumChildren());
		end;
		
		ShowCommand=cmd(bouncebegin,0.3;zoomy,1);
		HideCommand=cmd(linear,0.3;zoomy,0);
		
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(SetCurrentAndDestinationItem,4;playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(SetCurrentAndDestinationItem,4;playcommand,"Set");

		Display = Def.ActorFrame { 
			InitCommand=cmd(setsize,350,62);
			LoadActor(bbar);
			-- Clear mark 1P
			LoadActor("CourseEntryDisplay_Cleared") .. {
				InitCommand=cmd(x,-151;y,0;zoomtoheight,54;visible,false);
				SetSongCommand=function(self, params)
					self:stopeffect();
					self:diffuseblink();
					self:effectcolor1(color("#009999"));
					self:effectcolor2(PlayerColor(PLAYER_1));
					self:effectperiod(0.5);
					local course = GAMESTATE:GetCurrentCourse();
					local Trail = GAMESTATE:GetCurrentTrail(PLAYER_1);
					if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
						profile = PROFILEMAN:GetProfile(PLAYER_1);
					else
						return;
					end;
					scorelist = profile:GetHighScoreList(course,Trail);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topgrade;
					if scores[1] then
						topgrade = scores[1]:GetGrade();
						assert(topgrade);
						local state = grades[topgrade];
						if scores[1]:GetScore()>0 then
							self:visible(state);
						else
							self:visible(false);
						end;
					else
						self:visible(false);
					end;
				end;
				PlayerJoinedMessageCommand=function(self, params)
					if params.Player == PLAYER_1 then
						self:playcommand("SetSong");
					end;
				end;
			};
			-- Clear mark 2P
			LoadActor("CourseEntryDisplay_Cleared") .. {
				InitCommand=cmd(x,-151;y,0;zoomtoheight,54;visible,false);
				SetSongCommand=function(self, params)
					self:stopeffect();
					self:diffuseblink();
					self:effectcolor1(color("#990099"));
					self:effectcolor2(PlayerColor(PLAYER_2));
					self:effectperiod(0.5);
					local course = GAMESTATE:GetCurrentCourse();
					local Trail = GAMESTATE:GetCurrentTrail(PLAYER_2);
					if PROFILEMAN:IsPersistentProfile(PLAYER_2) then
						profile = PROFILEMAN:GetProfile(PLAYER_2);
					else
						return;
					end;
					scorelist = profile:GetHighScoreList(course,Trail);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topgrade;
					if scores[1] then
						topgrade = scores[1]:GetGrade();
						assert(topgrade);
						local state = grades[topgrade];
						if scores[1]:GetScore()>0 then
							self:visible(state);
						else
							self:visible(false);
						end;
					else
						self:visible(false);
					end;
					if GAMESTATE:IsSideJoined(PLAYER_1) and params.PlayerNumber == PLAYER_2 then
						if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
							profile2 = PROFILEMAN:GetProfile(PLAYER_1);
						end;
						scorelist2 = profile2:GetHighScoreList(course,Trail);
						assert(scorelist2);
						local scores2 = scorelist2:GetHighScores();
						assert(scores2);
						local topgrade2;
						if scores2[1] then
							topgrade2 = scores2[1]:GetGrade();
							assert(topgrade2);
							local state2 = grades[topgrade2];
							if scores2[1]:GetScore()>0 and state2 == true then
								self:croptop(0.5);
							else
								self:croptop(0);
							end;
						else
							self:croptop(0);
						end;
					end;
				end;
				PlayerJoinedMessageCommand=function(self, params)
					if params.Player == PLAYER_2 then
						self:playcommand("SetSong");
					end;
				end;
			};
			-- Banner or jacket
			Def.Banner{
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if AllSongsAreFixed then
						self:LoadBanner(GetJacketBanner(params.Song))
					else
						self:LoadFromSongGroup(params.Song:GetGroupName());
					--	self:Load(THEME:GetPathG("Common fallback","banner"));
					end;
					self:x(-114);
					self:zoom_to_course_banner();
				end;
			};
			--[[
			Def.Sprite{
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if AllSongsAreFixed then
						self:LoadBackground(GetJacketBanner(params.Song))
					else
						self:LoadBackground(params.Song:GetBannerPath())
					--	self:Load(THEME:GetPathG("Common fallback","banner"));
					end;
					self:x(-114);
					self:zoom_to_course_banner();
				end;
			};
			--]]
			-- Title and Artist	
			Def.TextBanner {
				InitCommand=cmd(zoom,0.9;x,-75;y,-12;Load,"TextBannerCourse";SetFromString,"", "", "", "", "", "");
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if params.Song then
						if AllSongsAreFixed then
							self:SetFromSong( params.Song );
							self:visible(true);
						else
							self:visible(false);
						end;
					else
						self:visible(false);
					end
				end;
			};
			-- Rancom Text
			LoadFont("_russellsquare Bold") .. {
				InitCommand=cmd(zoomx,1;zoomy,0.78;x,-22;y,-13;diffusetopedge,color("#fff90a");diffusebottomedge,color("#af5705");strokecolor,color("#000000"));
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if params.Song then
						if AllSongsAreFixed then
							self:visible(false);
						else	
							self:settext("RANDOM");
							self:visible(true);
						end;
					else
						self:visible(false);
					end
				end;
			};
			-- Number
			LoadFont("ScreenSelectMusic","CourseContentsList") .. {
				InitCommand=cmd(x,-162;y,-8;zoomx,1*1.08;zoomy,0.81*1.08;maxwidth,16;diffuse,color("#fff90a"));
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					self:settextf("%i", params.Number);
				end;
			};
			-- Save DifficultyMeter Group
			Def.Actor{
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if AllSongsAreFixed ~= true then return end
					local song = params.Song;
					local group = song:GetGroupName();
					local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
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
				end;
			};
			-- Meter back
			Def.Sprite {
			--	InitCommand=cmd(horizalign,left;x,-69;y,15);
				InitCommand=function(self)
					if GetDiffMeter == "10Meter" then
						self:Load(THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_difficultymeter10"));
					elseif GetDiffMeter == "20Meter" then
						self:Load(THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_difficultymeter20"));
					else
						self:Load(THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_difficultymeter_normal"));
					end;
					(cmd(x,-69;y,15;horizalign,left))(self);
				end;
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					self:diffuse(CustomDifficultyToDarkColor2(params.Difficulty));
				end;
			};
			-- Meter
			Def.Sprite {
				InitCommand=function(self)
					if GetDiffMeter == "10Meter" then
						self:Load(THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_difficultymeter10"));
					elseif GetDiffMeter == "20Meter" then
						self:Load(THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_difficultymeter20"));
					else
						self:Load(THEME:GetPathG("ScreenSelectMusic","CourseContentsList/CourseEntryDisplay_difficultymeter_normal"));
					end;
					(cmd(x,-69;y,15;horizalign,left))(self);
				end;
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					self:finishtweening();
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if AllSongsAreFixed then
						local meter;
						if GetDiffMeter == "10Meter" then
							meter = DifficultyMeter(params.Song,params.Difficulty,st);
							self:cropright(1-(meter*0.1));
						elseif GetDiffMeter == "20Meter" then
							meter = DifficultyMeter(params.Song,params.Difficulty,st);
							self:cropright(1-(meter*0.05));
						else
							local song = params.Song;
							local steps = song:GetOneSteps( st, params.Difficulty );
							meter = GetConvertDifficulty(params.Song,st,params.Difficulty,"test","MAX10");
							if TwentyMeterCheck(song,st) then
								if steps:GetMeter() >= 15 then
									meter = 10;
								elseif steps:GetMeter() < 15 and meter == 10 then
									meter = 9;
								end;
							else
								if steps:GetMeter() == 10 then
									meter = 10;
								elseif steps:GetMeter() < 10 and meter == 10 then
									meter = 9;
								end;
							end;
							self:cropright(1-(meter*0.1));
						end;
					else
						self:cropright(1);
						self:queuecommand("Sleep");
					end;
				end;
				SleepCommand = function(self)
					-- もう一度AllSongsAreFixedで選別しないと誤作動する場合がある
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if AllSongsAreFixed ~= true then
						local Ramdoms;
						local diff = GAMESTATE:GetCurrentTrail(mpn):GetDifficulty()
						if GetDiffMeter == "20Meter" then
							--[[
							if diff == "Difficulty_Easy" then
								Ramdoms = {3,4,5,6,7,8};
							elseif diff == "Difficulty_Medium" then
								Ramdoms = {4,5,6,7,8,9,10,11,12};
							elseif diff == "Difficulty_Hard" then
								Ramdoms = {8,9,10,11,12,13,14,15,16,17,18,19};
							end;
							--]]
							Ramdoms = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
							local RamdomDiff = Ramdoms[math.random(#Ramdoms)];
							self:cropright(1-(RamdomDiff*0.05));
						else
							--[[
							if diff == "Difficulty_Easy" then
								Ramdoms = {1,2,3,4,5,6};
							elseif diff == "Difficulty_Medium" then
								Ramdoms = {3,4,5,6,7,8};
							elseif diff == "Difficulty_Hard" then
								Ramdoms = {4,5,6,7,8,9,10};
							end;
							--]]
							Ramdoms = {1,2,3,4,5,6,7,8,9,10};
							local RamdomDiff = Ramdoms[math.random(#Ramdoms)];
							self:cropright(1-(RamdomDiff*0.1));
						end;
						self:sleep(0.5);
						self:queuecommand("Sleep");
					end;
				end;
			};
			--[[
			-- Difficulty number
			LoadFont("CourseEntryDisplay","difficulty") .. {
				InitCommand=cmd(x,147;y,15;zoom,0.6;horizalign,right);
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
				--	local meter=GetConvertDifficulty(params.Song,st,params.Difficulty,"ddr x","DDR MAX10");
					self:settextf("%2i",params.Meter);
				--	self:settextf(meter);
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				end;
			};
			--]]
			-- Difficulty number　変換用
			LoadFont("ScreenSelectMusic DifficultyNumber")..{
				InitCommand=cmd(x,147;y,15-4.7;zoom,0.6;horizalign,right);
				SetSongCommand=function(self, params)
					if params.PlayerNumber ~= mpn then return end
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
					local AllSongsAreFixed = GAMESTATE:GetCurrentCourse():AllSongsAreFixed();
					if AllSongsAreFixed then
						self:settextf("%2i",DifficultyMeter(params.Song,params.Difficulty,st));
					else
						self:settext(" ?");
					end;
				end;
			};
		};
	};
};