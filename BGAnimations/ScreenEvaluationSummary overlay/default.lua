-- Base from CyberiaStyle 7 by gl_yukt

local st = GAMESTATE:GetCurrentStyle():GetStepsType();

function Actor:zoom_to_banner_Summary()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
	--	self:zoomto(128,128);
		self:zoomto(58,58);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(58,32);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(58,32);
	else
	-- その他、通常DDR	
		self:zoomto(58,32);
	end
end

function Actor:zoom_to_banner_Summary_line()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(58,58);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(54,22.8);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(49,25);
	else
	-- その他、通常DDR	
		self:zoomto(55,19);
	end
end	

local mStages = STATSMAN:GetStagesPlayed();
local i = 0;

local DifficultyToFrame = {
	Difficulty_Beginner	= color("#5fbee2"),
	Difficulty_Easy		= color("#ffff00"),
	Difficulty_Medium	= color("#f16c7c"),
	Difficulty_Hard		= color("#00ff00"),
	Difficulty_Challenge	= color("#cc66ff"),
	Difficulty_Edit 	= color("#ffffff"),
	Difficulty_None		= color("#ffffff"),
};

local t = Def.ActorFrame {};  

-- Grade back
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
		if mStages == 1 then
--			self:addy(-50);
			self:addy(0);
		elseif mStages == 2 then
--			self:addy(-75);
			self:addy(0);
		elseif mStages == 3 then
--			self:addy(-100);
			self:addy(0);
		elseif mStages == 4 then
--			self:addy(-125);
			self:addy(0);
		elseif mStages == 5 then
--			self:addy(-150);
			self:addy(0);
		elseif mStages == 6 then
--			self:addy(-162.5);
			self:addy(0);
		elseif mStages == 7 then
--			self:addy(-162.5);
			self:addy(0);
		else
--			self:addy(-50);
			self:addy(0);
		end;
	end;

	LoadActor("Grade_Back") .. {
		BeginCommand=function(self)
		--	self:vertalign(center);
		    self:y(30);
			self:zoomtoheight(0);
			self:linear(0.25);
			if mStages == 1 then
				self:zoomtoheight(256);
			elseif mStages == 2 then
				self:zoomtoheight(256);
			elseif mStages == 3 then
				self:zoomtoheight(256);
			elseif mStages == 4 then
				self:zoomtoheight(500);
			elseif mStages == 5 then
				self:zoomtoheight(500);
			elseif mStages == 6 then
				self:zoomtoheight(500);
			elseif mStages == 7 then
				self:zoomtoheight(500);
			else
				self:zoomtoheight(500);
			end;
		end;
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	

	-- 1P Text
	LoadActor("1P") .. {
		InitCommand=cmd(x,-350;y,-190);
		OnCommand = cmd(zoomx,1;zoomy,0;sleep,0.25;linear,0.25;zoomy,1);
		OffCommand=cmd(linear,0.15;zoomy,0;);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
	};
	-- 2P Text
	LoadActor("2P") .. {
		InitCommand=cmd(x,350;y,-190);
		OnCommand = cmd(zoomx,1;zoomy,0;sleep,0.25;linear,0.25;zoomy,1);
		OffCommand=cmd(linear,0.15;zoomy,0;);
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
	};
};

-- Center
for i = 1, mStages do
	local ssStats = STATSMAN:GetPlayedStageStats( i );
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(Center);
		BeginCommand=function(self)
			if mStages == 2 then
				self:addy(-25 + ((mStages - i) * 68));
			elseif mStages == 3 then
				self:addy(-50 + ((mStages - i) * 68));
			elseif mStages == 4 then
				self:addy(-75 + ((mStages - i) * 68));
			elseif mStages == 5 then
				self:addy(-100 + ((mStages - i) * 68));
			elseif mStages == 6 then
				self:addy(-100 + ((mStages - i) * 68));
			elseif mStages == 7 then
				self:addy(-100 + ((mStages - i) * 68));
			else
				self:addy(((mStages - i) * 68));
			end;
		end;

		LoadActor( "BannerCenter" ) .. {
			InitCommand=cmd(diffusealpha,0;y,10);
			OnCommand=cmd(sleep,0.25;diffusealpha,1);
			OffCommand=cmd(diffusealpha,0);
		};
		
		-- banner line
		Def.Sprite {
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				self:x(-179);
				self:y(10);
				self:Load(GetJacketBanner(sssong))
				self:zoom_to_banner_Summary_line();
				self:diffuse(color("#000000"));
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoom_to_banner_Summary_line();
			end;
			OffCommand=cmd(linear,0.25;zoomy,0);						
		};
		
		-- banner
		Def.Sprite {
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				self:x(-180);
				self:y(10);
				self:Load(GetJacketBanner(sssong))
				self:zoom_to_banner_Summary();
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoom_to_banner_Summary();
			end;
			OffCommand=cmd(linear,0.25;zoomy,0);						
		};
		
		-- Title
		LoadFont("_russellsquare Bold 24px")..{
			InitCommand=cmd(zoomx,0.83;zoomy,0.65;maxwidth,263;diffuse,color("#000000");strokecolor,color("#ffffff"));
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				local sssmaint = sssong:GetDisplayMainTitle();
				self:x(26);
				self:settext(sssmaint);
				if sssong:GetDisplaySubTitle() == "" then
					self:y(0);
				else
					self:y(0);
				end;
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(0.65);
			end;
			OffCommand=cmd(diffusealpha,0);	
		};
		
		-- SubTitle
		LoadFont("_russellsquare Bold 24px")..{
			InitCommand=cmd(zoomx,0.57;zoomy,0.45;maxwidth,383;diffuse,color("#000000");strokecolor,color("#ffffff"));
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				local ssssubt = sssong:GetDisplaySubTitle();
				self:x(26);
				self:y(0.6);
				self:settext(ssssubt);
				if sssong:GetDisplaySubTitle() ~= "" then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(0.45);
			end;
			OffCommand=cmd(diffusealpha,0);	
		};
		
		-- Artist
		LoadFont("_futura std medium 20px")..{
			InitCommand=cmd(zoomx,1;zoomy,2;maxwidth,500;diffuse,color("#000000");strokecolor,color("#ffffff"));
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				local sssartistt = sssong:GetDisplayArtist();
				if sssong:GetDisplaySubTitle() == "" then
					self:y(20);
				else
					self:y(20);
				end;
				self:x(26);
				self:settext(sssartistt);
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(0.6);
			end;
			OffCommand=cmd(diffusealpha,0);	
		};
	};
end;

for pn in ivalues(PlayerNumber) do
	for i = 1, mStages do

	local sStats = STATSMAN:GetPlayedStageStats( i );
	local pStageStats = sStats:GetPlayerStageStats( pn );

	-- FullComboColor base from Default Extended by A.C
	local function GetFullComboEffectColor(pStageStats)
		local r;
			if pStageStats:FullComboOfScore('TapNoteScore_W1') then
				r=color("#fefed0");
			elseif pStageStats:FullComboOfScore('TapNoteScore_W2') then
				r=color("#f8fd6d");
			elseif pStageStats:FullComboOfScore('TapNoteScore_W3') then
				r=color("#01e603");
			elseif pStageStats:FullComboOfScore('TapNoteScore_W4') then
				r=color("#10e0f1");
			end;
		return r;
	end;
	
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(player,pn;Center);
		BeginCommand=function(self) 
			if mStages == 2 then
				self:addy(-25 + ((mStages - i) * 68));
			elseif mStages == 3 then
				self:addy(-50 + ((mStages - i) * 68));
			elseif mStages == 4 then
				self:addy(-75 + ((mStages - i) * 68));
			elseif mStages == 5 then
				self:addy(-100 + ((mStages - i) * 68));
			elseif mStages == 6 then
				self:addy(-100 + ((mStages - i) * 68));
			elseif mStages == 7 then
				self:addy(-100 + ((mStages - i) * 8));
			else
				self:addy(((mStages - i) * 68));
			end;
		end;
		OffCommand=function(self) 
			if pn == PLAYER_1 then
				self:linear(0.4); 
				self:addx(-SCREEN_WIDTH);
			else
				self:linear(0.4); 
				self:addx(SCREEN_WIDTH);
			end
			
		end;
		
		-- Label
		LoadActor( "label_under" ) .. {
			InitCommand=cmd(horizalign,right);
			OnCommand=function(self) 
				if pn == PLAYER_1 then
					self:x(-SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(-230);
					self:y(10);
					self:zoomy(1.37);
				else
					self:rotationy(180);
					self:x(SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(230);
					self:y(10);
					self:zoomy(1.37);
				end
			end;
		};
		
		-- difficulty
		LoadActor("label_color") .. {
			InitCommand=cmd(horizalign,right);
			BeginCommand=function(self)
				local p1ssstats = sStats:GetPlayerStageStats(pn);
				local p1ssstep = p1ssstats:GetPlayedSteps()[1]:GetDifficulty();
				local p1statediff = DifficultyToFrame[p1ssstep];
				if sStats then
					self:diffuse(p1statediff);
					self:visible(true);	
				else
					self:visible(false);
				end
				self:x(-146);
			end;
			OnCommand=function(self) 
				if pn == PLAYER_1 then
					self:x(-SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(-220);
					self:y(10);
					self:zoomy(1.37);
					self:zoomx(1.4);
				else
					self:rotationy(180);
					self:x(SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(220);
					self:y(10);
					self:zoomy(1.37);
					self:zoomx(1.4);
				end
			end;
		};

		-- fullcombo
		LoadActor(THEME:GetPathB("ScreenEvaluation","underlay/FullCombo")) .. {
			InitCommand=cmd();
			BeginCommand=function(self)
				if pn == PLAYER_1 then
					self:x(-250);
				else
					self:x(250);
				end
				self:y(-5);
				local grade = pStageStats:GetGrade();
				if grade ~= "Grade_Tier08" then
					if pStageStats:FullComboOfScore('TapNoteScore_W1') or pStageStats:FullComboOfScore('TapNoteScore_W2') or pStageStats:FullComboOfScore('TapNoteScore_W3') or pStageStats:FullComboOfScore('TapNoteScore_W4') then
						self:diffuse(GetFullComboEffectColor(pStageStats)); 
						self:visible(true);
					else
						self:visible(false);
					end
				else
					self:visible(false);
				end;
			end;
			OnCommand=function(self) 
				self:zoom(0);
				self:sleep(0.45+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:zoom(0.26);
			end;
		};

		-- grade
		Def.Sprite {
			InitCommand=cmd(zoom,0.2;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.8;effectperiod,0.2;y,35);
			BeginCommand=function(self) 
				local Grade = pStageStats:GetGrade();
				self:LoadBackground(THEME:GetPathG("GradeDisplayEval",ToEnumShortString(Grade)));
				if pn == PLAYER_1 then
					self:addx(-265);
				
				else
					self:addx(265);
					
				end
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.45+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:zoomy(0.2);
				
			end;
		};
	
		-- stage
		LoadFont("Common Normal")..{
			InitCommand=cmd(zoom,0.7;diffuse,color("#ffffff");strokecolor,color("#000000");maxwidth,190);
			BeginCommand=function(self)
				local pStage = sStats:GetStage();
				local stageText = StageToLocalizedString(pStage).." STAGE"
				if pn == PLAYER_1 then
					self:addx(-203);
					self:horizalign(right);
				else
					self:addx(203);
					self:horizalign(left);
				end
				self:addy(-8);
				self:settext(stageText);
			end;
			OnCommand=function(self) 
				if pn == PLAYER_1 then
					self:x(-SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(-310);
					self:y(0);
				else
					self:x(SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(310);
					self:y(0);
				end
			end;
		};
		
		-- Score
		Def.RollingNumbers {
			File=THEME:GetPathF("Common","Normal");
			InitCommand=cmd(Load,"RollingNumbersScore";zoom,0.8;diffusealpha,0;diffuse,color("#ffffff");strokecolor,color("#000000"));
			BeginCommand=function(self)
				local sStats = STATSMAN:GetPlayedStageStats(i);
				local pss = sStats:GetPlayerStageStats(pn)
				local song = sStats:GetPlayedSongs()[1];
				local diff = pss:GetPlayedSteps()[1]:GetDifficulty();
				local steps = song:GetOneSteps( st, diff );
				local radar = steps:GetRadarValues(pn);
				local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
				self:targetnumber(GetEvaScore(maxsteps,pss,pn));
				if pn == PLAYER_1 then
					self:horizalign(right);
					self:x(-204);
				else
					self:horizalign(left);
					self:x(204);
				end
				self:y(8);
			end;
			OnCommand=function(self)
				if pn == PLAYER_1 then
					self:x(-SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(-310);
					self:y(20);
				else
					self:x(SCREEN_WIDTH);
					self:sleep(0.05+(i-mStages)*-0.1);
					self:linear(0.4); 
					self:x(310);
					self:y(20);
				end
			end;
		};
	};
	end;
end;

return t