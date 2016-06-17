-- Base from CyberiaStyle 7 by gl_yukt

function Actor:zoom_to_banner_Summary()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(40,40);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(52,20.8);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(47,23);
	else
	-- その他、通常DDR	
		self:zoomto(53,17);
	end
end

function Actor:zoom_to_banner_Summary_line()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(42,42);
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
			self:addy(-50);
		elseif mStages == 2 then
			self:addy(-75);
		elseif mStages == 3 then
			self:addy(-100);
		elseif mStages == 4 then
			self:addy(-125);
		elseif mStages == 5 then
			self:addy(-150);
		elseif mStages == 6 then
			self:addy(-162.5);
		elseif mStages == 7 then
			self:addy(-162.5);
		else
			self:addy(-50);
		end;
	end;

	LoadActor("Grade_Back") .. {
		BeginCommand=function(self)
			self:vertalign(top);
			self:zoomtoheight(0);
			self:linear(0.25);
			if mStages == 1 then
				self:zoomtoheight(100);
			elseif mStages == 2 then
				self:zoomtoheight(150);
			elseif mStages == 3 then
				self:zoomtoheight(200);
			elseif mStages == 4 then
				self:zoomtoheight(250);
			elseif mStages == 5 then
				self:zoomtoheight(300);
			elseif mStages == 6 then
				self:zoomtoheight(350);
			elseif mStages == 7 then
				self:zoomtoheight(400);
			else
				self:zoomtoheight(400);
			end;
		end;
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	

	-- 1P Text
	LoadFont("_serpentinedbol 19px") .. {
		Text="PLAYER:1";
		InitCommand=cmd(addx,-233;addy,13;diffuse,PlayerColor(PLAYER_1);strokecolor,color("#000000"));
		OnCommand = cmd(zoomx,0.85;zoomy,0;sleep,0.25;linear,0.25;zoomy,0.8);
		OffCommand=cmd(linear,0.15;zoomy,0;);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
	};
	-- 2P Text
	LoadFont("_serpentinedbol 19px") .. {
		Text="PLAYER:2";
		InitCommand=cmd(addx,233;addy,13;diffuse,PlayerColor(PLAYER_2);strokecolor,color("#000000"));
		OnCommand = cmd(zoomx,0.85;zoomy,0;sleep,0.25;linear,0.25;zoomy,0.8);
		OffCommand=cmd(linear,0.15;zoomy,0;);
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
	};
	-- CPU(Battle)
	LoadFont("_serpentinedbol 19px") .. {
		Text="CPU";
		InitCommand=cmd(addx,-233;addy,13;diffuse,PlayerColor(PLAYER_1);strokecolor,color("#000000"));
		OnCommand = cmd(zoomx,0.85;zoomy,0;sleep,0.25;linear,0.25;zoomy,0.8);
		OffCommand=cmd(linear,0.15;zoomy,0;);
		Condition=not GAMESTATE:IsSideJoined(PLAYER_1) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
		};
	LoadFont("_serpentinedbol 19px") .. {
		Text="CPU";
		InitCommand=cmd(addx,233;addy,13;diffuse,PlayerColor(PLAYER_2);strokecolor,color("#000000"));
		OnCommand = cmd(zoomx,0.85;zoomy,0;sleep,0.25;linear,0.25;zoomy,0.8);
		OffCommand=cmd(linear,0.15;zoomy,0;);
		Condition=not GAMESTATE:IsSideJoined(PLAYER_2) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
	};
};





-- Center
for i = 1, mStages do
	local ssStats = STATSMAN:GetPlayedStageStats( i );
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(Center);
		BeginCommand=function(self)
			if mStages == 2 then
				self:addy(-25 + ((mStages - i) * 49));
			elseif mStages == 3 then
				self:addy(-50 + ((mStages - i) * 49));
			elseif mStages == 4 then
				self:addy(-75 + ((mStages - i) * 49));
			elseif mStages == 5 then
				self:addy(-100 + ((mStages - i) * 49));
			elseif mStages == 6 then
				self:addy(-100 + ((mStages - i) * 49));
			elseif mStages == 7 then
				self:addy(-100 + ((mStages - i) * 49));
			else
				self:addy(((mStages - i) * 49));
			end;
		end;

		LoadActor( "line" ) .. {
			InitCommand=cmd(diffusealpha,0);
			OnCommand=cmd(sleep,0.25;diffusealpha,1);
			OffCommand=cmd(diffusealpha,0);
		};
		
		-- banner line
		Def.Sprite {
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				self:x(-114);
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
				self:x(-114);
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
					self:y(-8);
				else
					self:y(-11.5);
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
		LoadFont("_russellsquare Bold 24px")..{
			InitCommand=cmd(zoomx,0.59;zoomy,0.47;maxwidth,371;diffuse,color("#000000");strokecolor,color("#ffffff"));
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				local sssartistt = sssong:GetDisplayArtist();
				if sssong:GetDisplaySubTitle() == "" then
					self:y(8);
				else
					self:y(11);
				end;
				self:x(26);
				self:settext(sssartistt);
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(0.47);
			end;
			OffCommand=cmd(diffusealpha,0);	
		};
	};
end;

for pn in ivalues(PlayerNumber) do
	for i = 1, mStages do

	local sStats = STATSMAN:GetPlayedStageStats( i );
	local pStageStats = sStats:GetPlayerStageStats( pn );
	
	local pStageStats_1P = sStats:GetPlayerStageStats( PLAYER_1 );
	local pStageStats_2P = sStats:GetPlayerStageStats( PLAYER_2 );
	
	local pScore_1P = pStageStats_1P:GetScore();
	local pScore_2P = pStageStats_2P:GetScore();
	

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
				self:addy(-25 + ((mStages - i) * 49));
			elseif mStages == 3 then
				self:addy(-50 + ((mStages - i) * 49));
			elseif mStages == 4 then
				self:addy(-75 + ((mStages - i) * 49));
			elseif mStages == 5 then
				self:addy(-100 + ((mStages - i) * 49));
			elseif mStages == 6 then
				self:addy(-100 + ((mStages - i) * 49));
			elseif mStages == 7 then
				self:addy(-100 + ((mStages - i) * 49));
			else
				self:addy(((mStages - i) * 49));
			end;
		end;
		
		-- Label 1P
		LoadActor( "label_under" ) .. {
			InitCommand=cmd(horizalign,right);
			OnCommand=function(self) 
				self:x(-SCREEN_WIDTH);
				self:sleep(0.05+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:x(-146);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(-SCREEN_WIDTH);
			end;
		};
		-- Label 2P
		LoadActor( "label_under" ) .. {
			InitCommand=cmd(horizalign,right);
			OnCommand=function(self) 
				self:rotationy(180);
				self:x(SCREEN_WIDTH);
				self:sleep(0.05+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:x(146);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(SCREEN_WIDTH);
			end;
		};
		
		-- difficulty 1P
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
			end;
			OnCommand=function(self) 
				self:x(-SCREEN_WIDTH);
				self:sleep(0.05+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:x(-146);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(-SCREEN_WIDTH);
			end;
		};
		-- difficulty 2P
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
			end;
			OnCommand=function(self)
				self:rotationy(180);
				self:x(SCREEN_WIDTH);
				self:sleep(0.05+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:x(146);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(SCREEN_WIDTH);
			end;
		};

		-- Rave 1P
		Def.Sprite {
			InitCommand=cmd(x,-233;y,8;zoom,0.3;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.8;effectperiod,0.2);
			OnCommand=function(self)
				if (pScore_1P - pScore_2P) == 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/draw"));
				elseif (pScore_1P - pScore_2P) > 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Win"));
				else
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Lose"));
				end;
				self:zoomy(0);
				self:sleep(0.45+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:zoomy(0.3);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(-SCREEN_WIDTH);
			end;
		};
		-- Rave 2P
		Def.Sprite {
			InitCommand=cmd(x,233;y,8;zoom,0.3;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.8;effectperiod,0.2);
			OnCommand=function(self)
				if (pScore_1P - pScore_2P) == 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/draw"));
				elseif (pScore_1P - pScore_2P) < 0 then
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Win"));
				else
					self:Load(THEME:GetPathB("ScreenEvaluation","overlay/Lose"));
				end;
				self:zoomy(0);
				self:sleep(0.45+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:zoomy(0.3);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(SCREEN_WIDTH);
			end;
		};
		
		-- stage 1P
		LoadFont("Common Normal")..{
			InitCommand=cmd(zoom,0.6;diffuse,color("#000000");strokecolor,color("#ffffff");maxwidth,190);
			BeginCommand=function(self)
				local pStage = sStats:GetStage();
				local tRemap = {
					Stage_1st		= 1,
					Stage_2nd		= 2,
					Stage_3rd		= 3,
					Stage_4th		= 4,
					Stage_5th		= 5,
					Stage_6th		= 6,
				};
				if tRemap[pStage] == mStages then
					self:settext("FINAL STAGE");
				else
					self:settext(StageToLocalizedString(pStage).." STAGE");
				end;
				self:addx(-233);
				self:addy(-8);
			end;
			OnCommand=function(self) 
				self:x(-SCREEN_WIDTH);
				self:sleep(0.05+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:x(-233);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(-SCREEN_WIDTH);
			end;
		};
		-- stage 2P
		LoadFont("Common Normal")..{
			InitCommand=cmd(zoom,0.6;diffuse,color("#000000");strokecolor,color("#ffffff");maxwidth,190);
			BeginCommand=function(self)
				local pStage = sStats:GetStage();
				local tRemap = {
					Stage_1st		= 1,
					Stage_2nd		= 2,
					Stage_3rd		= 3,
					Stage_4th		= 4,
					Stage_5th		= 5,
					Stage_6th		= 6,
				};
				if tRemap[pStage] == mStages then
					self:settext("FINAL STAGE");
				else
					self:settext(StageToLocalizedString(pStage).." STAGE");
				end;
				self:addx(233);
				self:addy(-8);
			end;
			OnCommand=function(self)
				self:x(SCREEN_WIDTH);
				self:sleep(0.05+(i-mStages)*-0.1);
				self:linear(0.4); 
				self:x(233);
			end;
			OffCommand=function(self) 
				self:linear(0.4); 
				self:addx(SCREEN_WIDTH);
			end;
		};
		
	};
	end;
end;

return t