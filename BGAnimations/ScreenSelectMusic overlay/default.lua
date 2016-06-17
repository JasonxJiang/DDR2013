local t = Def.ActorFrame {}
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

--　1st Move
t[#t+1]=Def.ActorFrame {
	InitCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:x(SCREEN_CENTER_X-320);
		else
			self:x(SCREEN_CENTER_X);
		end;
		self:y(SCREEN_CENTER_Y);
	end;
	OffCommand=cmd(zoom,0);
	-- Left---------------------------------------------------- ARROW NEXT SONG OR PREVIOUS SONG
	LoadActor("FrameMoveR") .. {
		InitCommand=cmd(x,-156;zoom,0.3;zoomx,-0.3);
		PreviousSongMessageCommand=cmd(finishtweening;linear,0.1;addx,-20;linear,0.1;addx,20;sleep,0.5;queuecommand,"Set");
		SetCommand=cmd(stopeffect);
	};
	LoadActor("ArrowMoveR") .. {
		InitCommand=cmd(x,-156;zoom,0.3;zoomx,-0.3;diffuse,color("#00ff00"));
		PreviousSongMessageCommand=cmd(finishtweening;diffuse,color("#f70000");linear,0.1;addx,-20;diffuse,color("#00ff00");linear,0.1;addx,20;diffuse,color("#f70000");queuecommand,"Set");
		SetCommand=cmd(stopeffect;diffuse,color("#00ff00"));
	};
	-- Right-----------------------------------------------------------------------------
	LoadActor("FrameMoveR") .. {
		InitCommand=cmd(x,156;zoom,0.3);
		NextSongMessageCommand=cmd(finishtweening;linear,0.1;addx,20;linear,0.1;addx,-20;sleep,0.5;queuecommand,"Set");
		SetCommand=cmd(stopeffect);
	};
	-- Right Arrow
	LoadActor("ArrowMoveR") .. {
		InitCommand=cmd(x,156;diffuse,color("#00ff00");zoom,0.3);
		NextSongMessageCommand=cmd(finishtweening;diffuse,color("#f70000");linear,0.1;addx,20;diffuse,color("#00ff00");linear,0.1;addx,-20;diffuse,color("#f70000");queuecommand,"Set");
		SetCommand=cmd(stopeffect;diffuse,color("#00ff00"));
	};
}

if not GAMESTATE:IsCourseMode() then
--[[	-- Dancer 1P
	t[#t+1]=Def.Sprite{
		InitCommand = cmd(player,PLAYER_1;vertalign,bottom;zoom,1.5;diffuse,PlayerColor(PLAYER_1);diffusealpha,0.75;x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y+44;blend,Blend.Add);
		OnCommand =function(self)
			local Ramdoms = {"A","B","C","D"}
			local RamdomDancer = Ramdoms[math.random(#Ramdoms)];
			self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/1Pdancer"..RamdomDancer));
			self:playcommand("Set");
		end;
		-- SetCommand base from DDR 5th MIX by AJ 187
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local dispBpms = song:GetDisplayBpms()
				local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
				local bps = (1/bpmLimited)*5;
				self:SetAllStateDelays(bps);
			else
				self:SetAllStateDelays(0.042);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
				(cmd(zoom,0;bounceend,0.3;zoom,1.5))(self);
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
				(cmd(bouncebegin,0.3;zoom,0))(self);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};
	-- Dancer 2P
	t[#t+1]=Def.Sprite{
		InitCommand = cmd(player,PLAYER_2;vertalign,bottom;zoom,1.5;diffuse,PlayerColor(PLAYER_2);diffusealpha,0.75;x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y+43;blend,Blend.Add);
		OnCommand =function(self)
			local Ramdoms = {"A","B","C","D"}
			local RamdomDancer = Ramdoms[math.random(#Ramdoms)];
			self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/2Pdancer"..RamdomDancer));
			self:playcommand("Set");
		end;
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local dispBpms = song:GetDisplayBpms()
				local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
				local bps = (1/bpmLimited)*5;
				self:SetAllStateDelays(bps);
			else
				self:SetAllStateDelays(0.042);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:visible(true);
				(cmd(zoom,0;bounceend,0.3;zoom,1.5))(self);
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:visible(true);
				(cmd(bouncebegin,0.3;zoom,0))(self);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	}; ]]--
---------------------------------------------------------- don't touch	
	-- CDtitle
	t[#t+1] = Def.Sprite {
		InitCommand=cmd(x,SCREEN_CENTER_X+135;y,SCREEN_CENTER_Y-158);
		CurrentSongChangedMessageCommand=function(self)
			local song=GAMESTATE:GetCurrentSong();
			if song then
				if song:HasCDTitle() then
					self:visible(true);
					self:LoadBackground(song:GetCDTitlePath());
					local height = self:GetHeight();
					local width = self:GetWidth();
					local heightlimit = 64;
					local widthlimit = 90;
					-- CDtitle resize script base from default_JousEdit_ScreenSelectMusic by Jousway.
					if height >= heightlimit and width >= widthlimit then
						if height*(widthlimit/heightlimit) >= width then
							self:zoom(heightlimit/height);
						else
							self:zoom(widthlimit/width);
						end;
					elseif height >= heightlimit then
						self:zoom(heightlimit/height);
					elseif width >= widthlimit then
						self:zoom(widthlimit/width);
					else 
						self:zoom(1);
					end;
				else
					self:visible(false);
				end;
			else
				self:visible(false)
			end
		end;
		SortOrderChangedMessageCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				self:linear(0.15);
				self:zoomy(0);
			else
				self:zoomy(1);
			end;
		end;
		OffCommand=cmd(scaletoclipped,0,0);
	};
	-- CDImage
	t[#t+1] = Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X-135;y,SCREEN_CENTER_Y-158;scaletoclipped,64,64);
		CurrentSongChangedMessageCommand=function(self)
			local song=GAMESTATE:GetCurrentSong();
			if song then
				if song:HasCDImage() then
					self:visible(true);
					self:LoadBackground(song:GetCDImagePath());
				else
					self:visible(false);
				end;
			else
				self:visible(false)
			end
		end;
		SortOrderChangedMessageCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				self:linear(0.15);
				self:zoomy(0);
			else
				self:zoomy(1);
			end;
		end;
		OffCommand=cmd(scaletoclipped,0,0);
	};
-----------------------------------------------------------------------------------------------------	
	--[[
	-- BGChanges Check
	t[#t+1] = LoadActor("movies") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-135;y,SCREEN_CENTER_Y-158;scaletoclipped,56,56);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:HasBGChanges() then
					self:visible(true);
					if song:HasCDImage() then
						self:x(SCREEN_CENTER_X-135-64);
					else
						self:x(SCREEN_CENTER_X-135);
					end;
				else
					self:visible(false);
				end;
			else
				self:visible(false)
			end
		end;
		SortOrderChangedMessageCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				self:linear(0.15);
				self:zoomy(0);
			else
				self:zoomy(1);
			end;
		end;
		OffCommand=cmd(scaletoclipped,0,0);
	};
	
	-- Lyrics Check
	t[#t+1] = LoadActor("Lyrics") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-135;y,SCREEN_CENTER_Y-158;scaletoclipped,52,52);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:HasLyrics() then
					self:visible(true);
					if song:HasCDImage() then
						if song:HasBGChanges() then
							self:x(SCREEN_CENTER_X-135-64-64);
						else
							self:x(SCREEN_CENTER_X-135-64);
						end;
					else
						self:x(SCREEN_CENTER_X-135);
					end;
				else
					self:visible(false);
				end;
			else
				self:visible(false)
			end;
		end;
		SortOrderChangedMessageCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				self:linear(0.15);
				self:zoomy(0);
			else
				self:zoomy(1);
			end;
		end;
	};
	--]]
	
	-- Balloon
	if not GAMESTATE:IsEventMode() then
		-- Long Song
		t[#t+1]=Def.Sprite {
			InitCommand=cmd(zoom,0.8;x,SCREEN_CENTER_X-93;y,SCREEN_CENTER_Y-206;bob;effectmagnitude,0,-4,0;diffusealpha,0);
			ShowCommand=cmd(finishtweening;linear,0.3;zoomy,0.8;diffusealpha,1);
			HideCommand=cmd(finishtweening;linear,0.3;zoomy,0;diffusealpha,0);
			BeginCommand=function(self)
				if THEME:GetCurLanguage() == "ja" then
					self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/Balloon_jp_Long"));
				else
					self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/Balloon_en_Long"));
				end;
			end;
			CurrentSongChangedMessageCommand=function(self)
				local Song = GAMESTATE:GetCurrentSong()
				self:playcommand( (Song and Song:IsLong()) and "Show" or "Hide" );
			end;
			OffCommand=cmd(zoom,0);
		};
		-- Marathon Song
		t[#t+1]=Def.Sprite {
			InitCommand=cmd(zoom,0.8;x,SCREEN_CENTER_X-93;y,SCREEN_CENTER_Y-206;bob;effectmagnitude,0,-4,0;diffusealpha,0);
			ShowCommand=cmd(finishtweening;linear,0.3;zoomy,0.8;diffusealpha,1);
			HideCommand=cmd(finishtweening;linear,0.3;zoomy,0;diffusealpha,0);
			BeginCommand=function(self)
				if THEME:GetCurLanguage() == "ja" then
					self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/Balloon_jp_Marathon"));
				else
					self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/Balloon_en_Marathon"));
				end;
			end;
			CurrentSongChangedMessageCommand=function(self)
				local Song = GAMESTATE:GetCurrentSong()
				self:playcommand( (Song and Song:IsMarathon()) and "Show" or "Hide" );
			end;
			OffCommand=cmd(zoom,0);
		};
	end;
--[[	
	-- PRESS START Parts
	if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" and GAMESTATE:IsEventMode() then
		t[#t+1]=Def.ActorFrame {
			InitCommand=function(self)
				self:y(SCREEN_CENTER_Y+4);
				if not GAMESTATE:IsSideJoined(PLAYER_2) then
					self:x(SCREEN_RIGHT-117);
				elseif not GAMESTATE:IsSideJoined(PLAYER_1) then
					self:x(SCREEN_LEFT+117);
				else
					self:visible(false);
				end;
			end;
			-- PRESS START
			LoadActor(THEME:GetPathB("ScreenSelectStyle","overlay/Press_Start")) .. {
				InitCommand = cmd(diffuseshift;effectcolor1,1,1,1,0.33;effectcolor2,0,0,0,0.33;effectperiod,2);
				PlayerJoinedMessageCommand=cmd(visible,false);	
				OffCommand=cmd(linear,0.25;diffusealpha,0);
			};
			-- OK
			LoadActor(THEME:GetPathB("ScreenSelectStyle","overlay/OK")) .. {
				InitCommand = cmd(visible,false);
				PlayerJoinedMessageCommand=cmd(visible,true;glow,color("1,1,1,0.1");diffusealpha,0.75;sleep,0.5;linear,0.25;diffusealpha,0;glow,color("1,1,1,0"));
				OffCommand=cmd(diffusealpha,0);
			};
			-- Sound
			LoadActor(THEME:GetPathS("Common", "start") ) .. {
				PlayerJoinedMessageCommand=cmd(play);
			};
		};
	end;]]--
---------------------------- MENU ON SIDE LEFT OR RIGHT TOP SCORE	
	if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
		-- TargetScore Bar
		local function GetProfileHighScores(pn)
			local profile = PROFILEMAN:GetProfile(pn);
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
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
		local function GetMachineHighScores(pn)
			local profile = PROFILEMAN:GetMachineProfile();
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
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
		-- Profile Check
		local function GetProfileHighScores2(pn,profile)
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
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
		
		-- Reset BGAnimations\ScreenTitleMenu background\default.lua
		local TargetBarP1 = getenv("TargetScoreBarP1");
		local TargetBarP2 = getenv("TargetScoreBarP2");
		local MenuState = {
			PlayerNumber_P1 = {
				Select = TargetBarP1,
			},
			PlayerNumber_P2 = {
				Select = TargetBarP2,
			},
		};
		-- TargetScore Bar
		-- 乱入OK用に調整、もし乱入不可にしたら再調整する
		for pn in ivalues(PlayerNumber) do
			local bTargetScore = TargetScore(pn);
			t[#t+1] = Def.ActorFrame {
				InitCommand=cmd(player,pn);
				OnCommand=function(self)
					if pn == PLAYER_1 then
						if MenuState[PLAYER_1].Select == 0 then
							self:x(SCREEN_LEFT-222);
							if bTargetScore == "off" then
								self:visible(false);
							end;
						elseif MenuState[PLAYER_1].Select == 2 then
							self:x(SCREEN_LEFT-222);
						else
							self:x(WideScale(SCREEN_LEFT-40,SCREEN_LEFT));
						end;
					else
						if MenuState[PLAYER_2].Select == 0 then
							self:x(SCREEN_RIGHT+222);
							if bTargetScore == "off" then
								self:visible(false);
							end;
						elseif MenuState[PLAYER_2].Select == 2 then
							self:x(SCREEN_RIGHT+222);
						else
							self:x(WideScale(SCREEN_RIGHT+40,SCREEN_RIGHT));
						end;
					end;
				end;
				OffCommand=cmd(diffusealpha,0);
				CodeMessageCommand=function(self,params)
					if params.PlayerNumber ~= pn then return end
					if params.Name == 'Select' then
						local select = MenuState[params.PlayerNumber].Select
						local pname = ToEnumShortString(pn);
						if select == 0 or select == 2 then
							self:visible(true);
							self:linear(0.25);
							if params.PlayerNumber == PLAYER_1 then
								self:addx(WideScale(222-0,222));
							else
								self:addx(WideScale(-222+0,-222));
							end;
							setenv("TargetScoreBar"..pname,1);
							MenuState[params.PlayerNumber].Select = 1
						else
							self:linear(0.25);
							if params.PlayerNumber == PLAYER_1 then
								self:addx(WideScale(-222+0,-222));
							else
								self:addx(WideScale(222-0,222));
							end;
							setenv("TargetScoreBar"..pname,2);
							MenuState[params.PlayerNumber].Select = 2
						end;
						MESSAGEMAN:Broadcast("SelectButton", { Player = params.PlayerNumber, Input = params.Name, })
					elseif params.Name == 'SelectUp' then
						MESSAGEMAN:Broadcast("SelectUpButton", { Player = params.PlayerNumber, Input = params.Name, })
					elseif params.Name == 'SelectDown' then
						MESSAGEMAN:Broadcast("SelectDownButton", { Player = params.PlayerNumber, Input = params.Name, })
					end;
				end;
				SelectUpButtonMessageCommand=function(self,params)
					if params.Player ~= pn then return end
					self:visible(true);
				end;
				SelectDownButtonMessageCommand=function(self,params)
					if params.Player ~= pn then return end
					self:visible(true);
				end;
				LoadActor("TargetScore_Bar_Select")..{
					InitCommand=function(self)
						if PROFILEMAN:IsPersistentProfile(pn) then
							if bTargetScore == "machine" then
								self:y(SCREEN_CENTER_Y-118);
							elseif bTargetScore == "personal" then
								self:y(SCREEN_CENTER_Y-158);
							elseif bTargetScore == "off" then
								self:visible(false);
							end;
						else
							if bTargetScore == "machine" then
								self:y(SCREEN_CENTER_Y-158);
							elseif bTargetScore == "personal" then
								self:y(SCREEN_CENTER_Y-158);
							elseif bTargetScore == "off" then
								self:visible(false);
							end;
						end;
						if pn == PLAYER_1 then
							self:horizalign(left);
						else
							self:zoomx(-1);
							self:horizalign(left);
						end;
					end;
					SelectUpButtonMessageCommand=function(self,params)
						local bTargetScore = TargetScore(pn);
						if params.Player ~= pn then return end
						if PROFILEMAN:IsPersistentProfile(pn) then
							local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
							if bTargetScore == "off" then
								self:visible(true);
								self:y(SCREEN_CENTER_Y-118);
								WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'machine');
							elseif bTargetScore == "personal" then
								self:visible(false);
								WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'off');
							elseif bTargetScore == "machine" then
								self:visible(true);
								self:y(SCREEN_CENTER_Y-158);
								WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'personal');
							end;
						else
							local pname = ToEnumShortString(pn);
							if bTargetScore == "off" then
								self:visible(true);
								self:y(SCREEN_CENTER_Y-158);
								WritePrefToFile("FirstReMIX_TargetScore_"..pname, 'machine');
							elseif bTargetScore == "personal" then
								self:visible(false);
								WritePrefToFile("FirstReMIX_TargetScore_"..pname, 'off');
							elseif bTargetScore == "machine" then
								self:visible(false);
								WritePrefToFile("FirstReMIX_TargetScore_"..pname, 'off');
							end;
						end;
					end;
					SelectDownButtonMessageCommand=function(self,params)
						local bTargetScore = TargetScore(pn);
						if params.Player ~= pn then return end
						if PROFILEMAN:IsPersistentProfile(pn) then
							local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
							if bTargetScore == "off" then
								self:visible(true);
								self:y(SCREEN_CENTER_Y-158);
								WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'personal');
							elseif bTargetScore == "personal" then
								self:visible(true);
								self:y(SCREEN_CENTER_Y-118);
								WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'machine');
							elseif bTargetScore == "machine" then
								self:visible(false);
								WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'off');
							end;
						else
							local pname = ToEnumShortString(pn);
							if bTargetScore == "off" then
								self:visible(true);
								self:y(SCREEN_CENTER_Y-158);
								WritePrefToFile("FirstReMIX_TargetScore_"..pname, 'machine');
							elseif bTargetScore == "personal" then
								self:visible(false);
								WritePrefToFile("FirstReMIX_TargetScore_"..pname, 'off');
							elseif bTargetScore == "machine" then
								self:visible(false);
								WritePrefToFile("FirstReMIX_TargetScore_"..pname, 'off');
							end;
						end;
					end;
					SetCommand=function(self)
						if not GAMESTATE:IsSideJoined(pn) then return end;
						local bTargetScore = TargetScore(pn);
						if PROFILEMAN:IsPersistentProfile(pn) then
							if bTargetScore == "machine" then
								self:y(SCREEN_CENTER_Y-118);
							elseif bTargetScore == "personal" then
								self:y(SCREEN_CENTER_Y-158);
							elseif bTargetScore == "off" then
								self:visible(false);
							end;
						else
							if bTargetScore == "machine" then
								self:y(SCREEN_CENTER_Y-158);
							elseif bTargetScore == "personal" then
								self:y(SCREEN_CENTER_Y-158);
							elseif bTargetScore == "off" then
								self:visible(false);
							end;
						end;
					end;
					SelectButtonMessageCommand=cmd(playcommand,"Set");
				};
				-- Sound
				LoadActor( THEME:GetPathS("", "_switch up") ) .. {
					SelectUpButtonMessageCommand=function(self,params)
						if params.Player ~= pn then return end
						self:play();
					end;
				};
				LoadActor( THEME:GetPathS("", "_switch down") ) .. {
					SelectDownButtonMessageCommand=function(self,params)
						if params.Player ~= pn then return end
						self:play();
					end;
				};
				LoadActor( THEME:GetPathS("", "_swoosh normal") ) .. {
					SelectButtonMessageCommand=function(self,params)
						if params.Player ~= pn then return end
						self:play();
					end;
				};
				-- BestScore
				Def.ActorFrame {
					InitCommand=function(self)
						self:y(SCREEN_CENTER_Y-158);
						if PROFILEMAN:IsPersistentProfile(pn) then
							self:visible(true);
						else
							self:visible(false);
						end;
					end;
					SetCommand=function(self)
						if not GAMESTATE:IsSideJoined(pn) then return end;
						if PROFILEMAN:IsPersistentProfile(pn) then
							self:visible(true);
						else
							self:visible(false);
						end;
					end;
					SelectButtonMessageCommand=cmd(playcommand,"Set");
					-- Back
					LoadActor("TargetScore_Bar_Back")..{
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:horizalign(left);
							else
								self:zoomx(-1);
								self:horizalign(left);
							end;
						end;
					};
					-- Text
					LoadFont("common normal") .. {
						InitCommand=function(self)
							self:settext(THEME:GetString("ScreenSelectMusic","BestScore"));
							if pn == PLAYER_1 then
								self:x(178);
							else
								self:x(-173);
							end;
							(cmd(diffuse,color("#fff90a");y,-11;zoom,0.4))(self)
						end;
					};
					-- Name
					LoadFont("common normal") .. {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:horizalign(left);
								self:x(75);
							else
								self:horizalign(left);
								self:x(-220);
							end;
							(cmd(y,-1;zoomx,0.7;zoomy,0.7*0.7;maxwidth,208;))(self)
						end;
						SetCommand=function(self)
							if MenuState[pn].Select == 0 then return end;
							if not GAMESTATE:IsSideJoined(pn) then return end;
							if not PROFILEMAN:IsPersistentProfile(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								local profile = PROFILEMAN:GetProfile(pn);
								local profilename = profile:GetDisplayName();
								local bestscore = GetProfileHighScores(pn);
								if bestscore ~= 0 then
									if profilename ~= nil then
										self:settext(profilename);
									else
										self:settext(" - - - - - - - -");
									end;
								else
									self:settext(" - - - - - - - -");
								end;
							else
								self:settext(" - - - - - - - -");
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
					-- Score
					Def.RollingNumbers {
						File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:horizalign(right);
								self:x(220);
							else
								self:horizalign(left);
								self:x(-220);
							end;
							(cmd(Load,"RollingNumbersScore";y,5;zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if MenuState[pn].Select == 0 then return end;
							if not GAMESTATE:IsSideJoined(pn) then return end;
							if not PROFILEMAN:IsPersistentProfile(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								local bestscore = GetProfileHighScores(pn);
								self:targetnumber(bestscore);
							else
								self:targetnumber(0);
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
					-- Color Icon
					Def.Sprite {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:x(231);
							else
								self:zoomx(-1);
								self:x(-231);
							end;
							(cmd(playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if not GAMESTATE:IsSideJoined(pn) then return end;
							if not PROFILEMAN:IsPersistentProfile(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								-- BestScore
								local bestscore = GetProfileHighScores(pn);
								if bestscore ~= 0 then
									self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Normal"));
								else
									self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Black"));
								end;
							else
								self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Black"));
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
					-- Text Icon
					Def.Sprite {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:x(231);
							else
								self:x(-231);
							end;
							(cmd(playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if not GAMESTATE:IsSideJoined(pn) then return end;
							if not PROFILEMAN:IsPersistentProfile(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								-- BestScore
								local bestscore = GetProfileHighScores(pn);
								if pn == PLAYER_1 then
									if bestscore ~= 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P1_Black"));
									else
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P1_White"));
									end;
								else
									if bestscore ~= 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P2_Black"));
									else
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P2_White"));
									end;
								end;
							else
								if pn == PLAYER_1 then
									self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P1_White"));
								else
									self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P2_White"));
								end;
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
				};
				
				-- TopScore
				Def.ActorFrame {
					InitCommand=function(self)
						if PROFILEMAN:IsPersistentProfile(pn) then
							self:y(SCREEN_CENTER_Y-118);
						else
							self:y(SCREEN_CENTER_Y-158);
						end;
					end;
					SetCommand=function(self)
						if not GAMESTATE:IsSideJoined(pn) then return end;
						if PROFILEMAN:IsPersistentProfile(pn) then
							self:y(SCREEN_CENTER_Y-118);
						else
							self:y(SCREEN_CENTER_Y-158);
						end;
					end;
					SelectButtonMessageCommand=cmd(playcommand,"Set");
					-- Back
					LoadActor("TargetScore_Bar_Back")..{
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:horizalign(left);
							else
								self:zoomx(-1);
								self:horizalign(left);
							end;
						end;
					};
					-- Text
					LoadFont("common normal") .. {
						InitCommand=function(self)
							self:settext(THEME:GetString("ScreenSelectMusic","TopScore"));
							if pn == PLAYER_1 then
								self:x(178);
							else
								self:x(-173);
							end;
							(cmd(diffuse,color("#fff90a");y,-11;zoom,0.4))(self)
						end;
					};
					-- Name
					LoadFont("common normal") .. {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:horizalign(left);
								self:x(75);
							else
								self:horizalign(left);
								self:x(-220);
							end;
							(cmd(y,-1;zoomx,0.7;zoomy,0.7*0.7;maxwidth,208;playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if MenuState[pn].Select == 0 then return end;
							if not GAMESTATE:IsSideJoined(pn) then return end;
							if PROFILEMAN:GetNumLocalProfiles() == 0 then return self:settext(" - - - - - - - -") end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								local topscore = GetMachineHighScores(pn);
								-- プロフィールからベストスコアを総当たりで取得し、トップスコアと合致させる、プロフィールナンバーが小さい方が優先になる
								if topscore ~= 0 then
									for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
										local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
										local topscore2 = GetProfileHighScores2(pn,profile);
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
							else
								self:settext(" - - - - - - - -");
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
					-- Score
					Def.RollingNumbers {
						File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:horizalign(right);
								self:x(220);
							else
								self:horizalign(left);
								self:x(-220);
							end;
							(cmd(Load,"RollingNumbersScore";y,5;zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if MenuState[pn].Select == 0 then return end;
							if not GAMESTATE:IsSideJoined(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								-- TopScore
								local topscore = GetMachineHighScores(pn);
								self:targetnumber(topscore);
							else
								self:targetnumber(0);
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
					-- Color Icon
					Def.Sprite {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:x(231);
							else
								self:zoomx(-1);
								self:x(-231);
							end;
							(cmd(playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if not GAMESTATE:IsSideJoined(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								-- TopScore
								local topscore = GetMachineHighScores(pn);
								if PROFILEMAN:IsPersistentProfile(pn) then
									local bestscore = GetProfileHighScores(pn);
									if bestscore == 0 and topscore ~= 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Yellow"));
									elseif bestscore == 0 and topscore == 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Black"));
									elseif topscore > bestscore then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Red"));
									else
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Blue"));
									end;
								else
									if topscore ~= 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Normal"));
									else
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Black"));
									end;
								end;
							else
								self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_Black"));
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
					-- Text Icon
					Def.Sprite {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:x(231);
							else
								self:x(-231);
							end;
							(cmd(playcommand,"Set"))(self)
						end;
						SetCommand=function(self)
							if not GAMESTATE:IsSideJoined(pn) then return end;
							local song = GAMESTATE:GetCurrentSong()
							if song then
								-- TopScore
								local topscore = GetMachineHighScores(pn);
								if PROFILEMAN:IsPersistentProfile(pn) then
									-- BestScore
									local bestscore = GetProfileHighScores(pn);
									if bestscore == 0 and topscore ~= 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_Black"));
									elseif bestscore == 0 and topscore == 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_White"));
									elseif topscore > bestscore then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_Black"));
									else
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_Black"));
									end;
								else
									if topscore ~= 0 then
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_Black"));
									else
										self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_White"));
									end;
								end;
							else
								self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_All_White"));
							end;
						end;
						CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
						CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
						SelectButtonMessageCommand=cmd(playcommand,"Set");
					};
				};
			};
		end;
	end;
end;
-------------------------------------------------------------------------------------------------------------------------------
--[[
-- test
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) then
		-- 1
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230);
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = GetSN2Score(pn,steps,scores[1]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 2
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20);
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[2] then
						topscore = GetSN2Score(pn,steps,scores[2]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 3
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*2);
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[3] then
						topscore = GetSN2Score(pn,steps,scores[3]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 4
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*3);
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[4] then
						topscore = GetSN2Score(pn,steps,scores[4]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 5
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(5-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[5] then
						topscore = GetSN2Score(pn,steps,scores[5]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 6
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(6-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[6] then
						topscore = GetSN2Score(pn,steps,scores[6]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 7
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(7-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[7] then
						topscore = GetSN2Score(pn,steps,scores[7]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 8
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(8-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[8] then
						topscore = GetSN2Score(pn,steps,scores[8]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 9
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(9-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[9] then
						topscore = GetSN2Score(pn,steps,scores[9]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 10
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(10-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[10] then
						topscore = GetSN2Score(pn,steps,scores[10]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 11
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(11-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[11] then
						topscore = GetSN2Score(pn,steps,scores[11]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 12
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(12-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[12] then
						topscore = GetSN2Score(pn,steps,scores[12]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 13
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(13-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[13] then
						topscore = GetSN2Score(pn,steps,scores[13]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 14
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(14-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[14] then
						topscore = GetSN2Score(pn,steps,scores[14]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 15
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(15-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[15] then
						topscore = GetSN2Score(pn,steps,scores[15]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 16
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(16-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[16] then
						topscore = GetSN2Score(pn,steps,scores[16]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 17
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(17-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[17] then
						topscore = GetSN2Score(pn,steps,scores[17]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 18
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(18-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[18] then
						topscore = GetSN2Score(pn,steps,scores[18]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 19
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(19-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[19] then
						topscore = GetSN2Score(pn,steps,scores[19]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 20
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(20-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[20] then
						topscore = GetSN2Score(pn,steps,scores[20]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 21
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(21-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[21] then
						topscore = GetSN2Score(pn,steps,scores[21]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 22
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(22-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[22] then
						topscore = GetSN2Score(pn,steps,scores[22]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 23
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(23-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[23] then
						topscore = GetSN2Score(pn,steps,scores[23]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 24
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(24-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[24] then
						topscore = GetSN2Score(pn,steps,scores[24]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 25
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(25-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[25] then
						topscore = GetSN2Score(pn,steps,scores[25]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 26
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(26-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[26] then
						topscore = GetSN2Score(pn,steps,scores[26]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 27
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(27-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[27] then
						topscore = GetSN2Score(pn,steps,scores[27]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 28
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(28-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[28] then
						topscore = GetSN2Score(pn,steps,scores[28]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 29
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(29-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[29] then
						topscore = GetSN2Score(pn,steps,scores[29]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 30
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(30-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[30] then
						topscore = GetSN2Score(pn,steps,scores[30]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 31
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(31-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[31] then
						topscore = GetSN2Score(pn,steps,scores[31]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 32
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(32-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[32] then
						topscore = GetSN2Score(pn,steps,scores[32]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 33
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(33-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[33] then
						topscore = GetSN2Score(pn,steps,scores[33]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 34
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(34-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[34] then
						topscore = GetSN2Score(pn,steps,scores[34]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 35
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(35-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[35] then
						topscore = GetSN2Score(pn,steps,scores[35]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 36
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(36-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[36] then
						topscore = GetSN2Score(pn,steps,scores[36]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 37
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(37-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[37] then
						topscore = GetSN2Score(pn,steps,scores[37]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 38
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(38-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[38] then
						topscore = GetSN2Score(pn,steps,scores[38]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 39
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(39-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[39] then
						topscore = GetSN2Score(pn,steps,scores[39]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
		-- 40
		t[#t+1] = Def.RollingNumbers {
			File=THEME:GetPathF("ScreenSelectMusic","DifficultyScore");
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(SCREEN_CENTER_X+220);
				else
					self:horizalign(left);
					self:x(SCREEN_CENTER_X-220);
				end;
					self:y(SCREEN_CENTER_Y-230+20*(40-1));
				(cmd(Load,"RollingNumbersScore";zoom,0.47;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
			end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- TopScore
					local profile = PROFILEMAN:GetMachineProfile();
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[40] then
						topscore = GetSN2Score(pn,steps,scores[40]);
					end;
					assert(topscore);
					
					if topscore == 0 then
						self:targetnumber(0);
					else
						self:targetnumber(topscore);
					end;
				else
					self:targetnumber(0);
				end;
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			SelectButtonMessageCommand=cmd(playcommand,"Set");
		};
	end;
end;
--]]

return t