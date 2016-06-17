local t = Def.ActorFrame{};
local GroupNameChange = getenv("GroupNameChange");
--[[
-- Door
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,SCREEN_CENTER_Y);
	OnCommand=function(self)
		if GAMESTATE:HasEarnedExtraStage() then
			if GAMESTATE:IsExtraStage() then
				self:diffuse(color("#ffffff"));
			elseif GAMESTATE:IsExtraStage2() then
				self:diffuse(color("#ff5aec"));
			end;
		else
			if GAMESTATE:IsExtraStage() then
				self:diffuse(color("#ff5aec"));
			elseif GAMESTATE:IsExtraStage2() then
				self:diffuse(color("#ff5a63"));
			end;
		end;
	end;
	LoadActor( "../door1" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X);
	};	
	LoadActor( "../doorbottan1" ) .. {	
		InitCommand=cmd(horizalign,left;x,SCREEN_LEFT);
	};	
	LoadActor( "../door2" ) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X);
	};
	LoadActor( "../doorbottan2" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT);
	};	
};
]]--
-- Banner frame
t[#t+1] = LoadActor("EvalBannerFrame") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand = cmd(zoom,0;linear,0.25;zoom,1);
	OffCommand=cmd(linear,0.25;diffusealpha,0);
};
	
-- Judgment back
t[#t+1] = Def.Sprite {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(zoomy,0;linear,0.25;zoomy,1);
	BeginCommand=function(self)
		if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if (Var "LoadingScreen") == "ScreenEvaluationRave" then
				self:Load(THEME:GetPathB("ScreenEvaluation","underlay/Judgment_Rave_Back"));
			else
				self:Load(THEME:GetPathB("ScreenEvaluation","underlay/Judgment_RaveSummary2_Back"));
			end;
		else
			self:Load(THEME:GetPathB("ScreenEvaluation","underlay/judgmentBG"));
		end;
	end;
	OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
};

if (Var "LoadingScreen") == "ScreenEvaluationNormal" or (Var "LoadingScreen") == "ScreenEvaluationRave" then
	-- Music text
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(playcommand,"Update";x,SCREEN_CENTER_X+55;y,SCREEN_CENTER_Y-129+4;diffuse,color("#000000"));
		-- SongTitle or CourseTitle
		LoadFont("_russellsquare Bold 24px")..{
			InitCommand=cmd(zoomx,0.8;zoomy,0.8;maxwidth,391;strokecolor,color("#ffffff"));
			OnCommand = cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
			OffCommand=cmd(linear,0.25;diffusealpha,0);
			UpdateCommand=function(self)
				local title;
				if GAMESTATE:IsCourseMode() then
					local course = GAMESTATE:GetCurrentCourse();
					local group = course:GetGroupName();
					if group == "" or group == "Default" then
						self:y(-10);
					else
						self:y(16);
					end;
					if GroupNameChange then
						title = ChangeGroupName(course:GetDisplayFullTitle());
					else
						title = course:GetDisplayFullTitle();
					end;
				else
					local song = GAMESTATE:GetCurrentSong();
					title = song:GetDisplayMainTitle();
					if song:GetDisplaySubTitle() == ""  then
						self:y(-65);
					else
						self:y(12.5);
					end;
				end;
				if title == "" then
					title = "???";
				end;
				self:settext(title);
			end;
		};
		-- Subtitle		
		LoadFont("_russellsquare Bold 24px")..{
			InitCommand=cmd(zoomx,0.57;zoomy,0.45;maxwidth,403;strokecolor,color("#ffffff"));
			OnCommand = cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
			OffCommand=cmd(linear,0.25;diffusealpha,0);						
			UpdateCommand=function(self)
				local subtitle;
				if GAMESTATE:IsCourseMode() then
					self:visible(false);
					return;
				else
					local song = GAMESTATE:GetCurrentSong();
					subtitle = song:GetDisplaySubTitle();
					if subtitle == "" then
						self:visible(false);
						return;
					end;
					self:y(24.6);
				end;
				self:settext(subtitle);
			end;
		};
		-- SongArtist or CourseGroupFolder	
		LoadFont("_russellsquare Bold 24px")..{
			InitCommand=cmd(zoomx,0.8;zoomy,0.8;maxwidth,391;strokecolor,color("#ffffff"));
			OnCommand = cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
			OffCommand=cmd(linear,0.25;diffusealpha,0);
			UpdateCommand=function(self)
				local artist;
				if GAMESTATE:IsCourseMode() then
					local course = GAMESTATE:GetCurrentCourse();
					if GroupNameChange then
						artist = ChangeGroupName(course:GetGroupName())
					else
						artist = course:GetGroupName();
					end;
					self:y(32);
					if artist == "" or artist == "Default" then return self:visible(false) end;
				else
					local song = GAMESTATE:GetCurrentSong();
					artist = song:GetDisplayArtist();
					if artist == "Unknown artist" or artist == "♪♪♪♪♪" then
						self:visible(false);
						return;
					elseif artist == "" then
						self:y(32);
					else
						self:y(-30);
					end;
				end;
				self:settext(artist);
			end;
		};
	};
	-- Music text(Course)	
	--[[
	t[#t+1] = LoadFont( "_russellsquare Bold 24px" ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+55;y,SCREEN_CENTER_Y-105;diffuse,color("#000000");NoStroke;);
		OnCommand = cmd(zoomx,0.83;zoomy,0.65;maxwidth,250;diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		BeginCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse();
			local s = "";
			if GAMESTATE:IsCourseMode() then
				s = course:GetDisplayFullTitle();
			end;
			self:settext(s);
		end;
		Condition=GAMESTATE:IsCourseMode();
	};
	--]]    
------------- BANNER SONG ---------	
	t[#t+1] = Def.Banner{
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-235;y,SCREEN_CENTER_Y-178);
		BeginCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				local course = GAMESTATE:GetCurrentCourse();
				if course then
					self:LoadFromCourse(course);
					self:scale_to_clip_banner();
				end;
			else
				local song = GAMESTATE:GetCurrentSong();
				if song then
					self:LoadBackground(GetJacketBanner(song));
					self:scale_to_clip_banner();
				end;
			end;
		end;
		OnCommand = cmd(zoom,0.40;diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
end;
-------------- FULL COMBO ----- GO METRICS GRADE TO MODIFY SCREEN EVAL
for pn in ivalues(PlayerNumber) do
	-- FullCombo ring
	local MetricsName = "StageAwardRing" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor("Fullcombo") .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local pss = THEME:GetMetric(Var "LoadingScreen", "Summary") and STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn) or STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
			local grade = pss:GetGrade();
			if grade ~= "Grade_Tier08" then
				if pss:FullComboOfScore('TapNoteScore_W1') then
					self:diffuse(color("#fefed0"));
				elseif pss:FullComboOfScore('TapNoteScore_W2') then
					self:diffuse(color("#f8fd6d"));
				elseif pss:FullComboOfScore('TapNoteScore_W3') then
					self:diffuse(color("#01e603"));
				elseif pss:FullComboOfScore('TapNoteScore_W4') then
					self:diffuse(color("#10e0f1"));
				else
					self:visible(false);
				end;
			else
				self:visible(false);
			end;
		end;
	};
--[[	if GAMESTATE:IsPlayerEnabled(pn) then
		-- PLAYER:1 or 2 or CPU
		t[#t+1] = LoadFont("_serpentinedbol 19px") .. {
			InitCommand=cmd(y,SCREEN_CENTER_Y-27;diffuse,PlayerColor(pn);strokecolor,color("#000000");playcommand,"Set");
			OnCommand = cmd(zoomx,0.85;zoomy,0;sleep,0.25;linear,0.25;zoomy,0.8);
			SetCommand=function(self)
				local name;
				if pn == PLAYER_1 then
					self:x(WideScale(SCREEN_CENTER_X-227,SCREEN_CENTER_X-236));
					if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' and not GAMESTATE:IsSideJoined(PLAYER_1) then
						name = "CPU";
					else
						name = "PLAYER:1";
					end
				else
					self:x(WideScale(SCREEN_CENTER_X+227,SCREEN_CENTER_X+236));
					if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' and not GAMESTATE:IsSideJoined(PLAYER_2) then
						name = "CPU";
					else
						name = "PLAYER:2";
					end
				end;
				self:settext(name);
			end;
			OffCommand=cmd(sleep,0.25;linear,0.15;zoomy,0);
		};
	end;]]--
end;

return t;