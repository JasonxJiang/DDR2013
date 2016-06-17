--　FullCombo base from moonlight by AJ 187

local pn = ...;
assert(pn);

local w1 = {0,0};
local w2 = {0,0};
local w3 = {0,0};
local w4 = {0,0};
local hd = {0,0};
local p=((pn == PLAYER_1) and 1 or 2);

local t = Def.ActorFrame {
	JudgmentMessageCommand = function(self,params)
		if params.Player ~= pn then return end
		if params.TapNoteScore and
		   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
		   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
		   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
		   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
		   params.TapNoteScore ~= 'TapNoteScore_None'
		then
			if params.HoldNoteScore=='HoldNoteScore_Held' then
				hd[p]=hd[p]+1;
			elseif params.TapNoteScore=='TapNoteScore_W1' then
				w1[p]=w1[p]+1;
			elseif params.TapNoteScore=='TapNoteScore_W2' then
				w2[p]=w2[p]+1;
			elseif params.TapNoteScore=='TapNoteScore_W3' then
				w3[p]=w3[p]+1;
			elseif params.TapNoteScore=='TapNoteScore_W4' then
				w4[p]=w4[p]+1;
			end;
			self:queuecommand("Check");
		end
	end;
	CheckCommand=function(self)
		self:finishtweening();
		local maxsteps = getenv("EndlessMaxSteps");
		if maxsteps == w1[p] + w2[p] + w3[p] + w4[p] + hd[p] then
			self:sleep(0.25);
			self:queuecommand("Fullcombo");
		end;
	end;
	CurrentSongChangedMessageCommand=function(self)
		w1[p] = 0;
		w2[p] = 0;
		w3[p] = 0;
		w4[p] = 0;
		hd[p] = 0;
	end;
}

local Center1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

-- ComboGraphic
local bComboGraphic = ComboGraphic(pn);

local function GetPosition(pn)
	if Center1Player and NumPlayers == 1 and NumSides == 1 then return SCREEN_CENTER_X; end;
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
	return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn) .. strPlayer .. strSide .."X");
end;

local function GradationWidth()
	if st == "StepsType_Dance_Double" then return (2);
	elseif st == "StepsType_Dance_Solo" then return (1.5);
	else return (1);
	end;
end;

local function DownGradationWidth()
	if st == "StepsType_Dance_Double" then return (SCREEN_WIDTH);
	elseif st == "StepsType_Dance_Solo" then return (384);
	else return (256);
	end;
end;

local function TextZoom()
	if st == "StepsType_Dance_Double" then return (1.61);
	elseif st == "StepsType_Dance_Solo" then return (1.3);
	else return (1);
	end;
end;

-- FullComboColor base from Default Extended by A.C
local function GetFullComboEffectColor(pn)
	if w2[p] + w3[p] + w4[p] == 0 then
		return color("#ffffff");
	elseif w3[p] + w4[p] == 0 then
		return color("#fafc44");
	elseif w4[p] == 0 then
		return color("#06fd32");
	else
		return color("#00ffff");
	end;
end;

-- Ring color
local function GetRingColor()
	if w2[p] + w3[p] + w4[p] == 0 then
		return color("#fff999");
	elseif w3[p] + w4[p] == 0 then
		return color("#fff999");
	elseif w4[p] == 0 then
		return color("#ffffe7");
	else
		return color("#ffffe7");
	end;
end;

-- Sound
t[#t+1] = LoadActor("Combo_Splash") .. {
	FullcomboCommand=function(self)
		self:play();
	end;
};

-- Parts
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,GetPosition(pn);diffusealpha,0);
	FullcomboCommand = function(self)
		self:diffuse(GetFullComboEffectColor(pn));
	end;

	-- Note flash star
	Def.ActorFrame{
		InitCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+152);
			else
				self:y(SCREEN_CENTER_Y-160);
			end;
		end;
		-- Left
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:x(-32);
				self:rotationz(-25);
				self:zoomx(0.5);
				self:zoomy(1);
				self:linear(0.5);
				self:zoom(0.3);
				self:rotationz(65);
				self:linear(0.25);
				self:zoom(0);
				self:rotationz(155);
			end;
		};
		-- Right
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:x(32);
				self:rotationz(35);
				self:zoomx(0.5);
				self:zoomy(1);
				self:linear(0.5);
				self:zoom(0.3);
				self:rotationz(-55);
				self:linear(0.25);
				self:zoom(0);
				self:rotationz(-145);
			end;
		};
		-- Left2
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:x(-96);
				self:rotationz(-60);
				self:zoomx(0.5);
				self:zoomy(1);
				self:linear(0.5);
				self:zoom(0.3);
				self:rotationz(30);
				self:linear(0.25);
				self:zoom(0);
				self:rotationz(120);
			end;
		};
		-- Right2
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:x(96);
				self:rotationz(90);
				self:zoomx(0.5);
				self:zoomy(1);
				self:linear(0.5);
				self:zoom(0.3);
				self:rotationz(0);
				self:linear(0.25);
				self:zoom(0);
				self:rotationz(-90);
			end;
		};
		-- Left3 Solo and Double
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" then
					self:diffusealpha(0.5);
					self:x(-160);
					self:rotationz(-15);
					self:zoomx(0.5);
					self:zoomy(1);
					self:linear(0.5);
					self:zoom(0.3);
					self:rotationz(75);
					self:linear(0.25);
					self:zoom(0);
					self:rotationz(165);
				else
					self:visible(false);
				end;
			end;
		};
		-- Right3 Solo and Double
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" then
					self:diffusealpha(0.5);
					self:x(160);
					self:rotationz(90);
					self:zoomx(0.5);
					self:zoomy(1);
					self:linear(0.5);
					self:zoom(0.3);
					self:rotationz(0);
					self:linear(0.25);
					self:zoom(0);
					self:rotationz(-90);
				else
					self:visible(false);
				end;
			end;
		};
		-- Left4 Double
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" then
					self:visible(true);
					self:diffusealpha(0.5);
					self:x(-224);
					self:rotationz(-60);
					self:zoomx(0.5);
					self:zoomy(1);
					self:linear(0.5);
					self:zoom(0.3);
					self:rotationz(30);
					self:linear(0.25);
					self:zoom(0);
					self:rotationz(120);
				else
					self:visible(false);
				end;
			end;
		};
		-- Right4 Double
		LoadActor("Star") .. {
			InitCommand=cmd(blend,Blend.Add);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" then
					self:diffusealpha(0.5);
					self:x(224);
					self:rotationz(35);
					self:zoomx(0.5);
					self:zoomy(1);
					self:linear(0.5);
					self:zoom(0.3);
					self:rotationz(-55);
					self:linear(0.25);
					self:zoom(0);
					self:rotationz(-145);
				else
					self:visible(false);
				end;
			end;
		};
	};
	
	-- Up gradation
	LoadActor("Down") .. {
		InitCommand=cmd(vertalign,bottom);
		FullcomboCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_BOTTOM);
				self:diffusealpha(0.5);
				self:zoomx(GradationWidth());
				self:zoomy(1);
				self:linear(0.25);
				self:diffusealpha(0.25);
				self:zoomx(GradationWidth()+0.25);
				self:zoomy(2);
				self:linear(0.25);
				self:zoomx(GradationWidth());
				self:zoomy(1.5);
				self:diffusealpha(0);
			else
				self:y(SCREEN_TOP);
				self:diffusealpha(0.5);
				self:zoomx(GradationWidth());
				self:zoomy(-1);
				self:linear(0.25);
				self:diffusealpha(0.25);
				self:zoomx(GradationWidth()+0.25);
				self:zoomy(-2);
				self:linear(0.25);
				self:zoomx(GradationWidth());
				self:zoomy(-1.5);
				self:diffusealpha(0);
			end;
		end;
	};
	
	-- Slim light
	Def.ActorFrame{
		InitCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+152);
			else
				self:y(SCREEN_CENTER_Y-160);
			end;
		end;
		-- Center
		LoadActor("Slim") .. {
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:zoomy(0.5);
				self:linear(0.25);
				self:diffusealpha(0.25);
				self:zoomx(1);
				self:zoomy(1.75);
				self:linear(0.25);
				self:zoomx(0);
				self:zoomy(0.5);
				self:diffusealpha(0);
			end;
		};
		-- Left
		LoadActor("Slim") .. {
			InitCommand=cmd(addx,-64);
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:zoomy(0.5);
				self:linear(0.25);
				self:diffusealpha(0.25);
				self:zoomx(1);
				self:zoomy(1.75);
				self:linear(0.25);
				self:zoomx(0);
				self:zoomy(0.5);
				self:diffusealpha(0);
			end;
		};
		-- Right
		LoadActor("Slim") .. {
			InitCommand=cmd(addx,64);
			FullcomboCommand=function(self)
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:zoomy(0.5);
				self:linear(0.25);
				self:diffusealpha(0.25);
				self:zoomx(1);
				self:zoomy(1.75);
				self:linear(0.25);
				self:zoomx(0);
				self:zoomy(0.5);
				self:diffusealpha(0);
			end;
		};
		-- Solo and Double left
		LoadActor("Slim") .. {
			InitCommand=cmd(addx,-128);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" then
					self:diffusealpha(0.5);
					self:zoomx(0);
					self:zoomy(0.5);
					self:linear(0.25);
					self:diffusealpha(0.25);
					self:zoomx(1);
					self:zoomy(1.75);
					self:linear(0.25);
					self:zoomx(0);
					self:zoomy(0.5);
					self:diffusealpha(0);
				else
					self:visible(false);
				end;
			end;
		};
		-- Solo and Double right
		LoadActor("Slim") .. {
			InitCommand=cmd(addx,128);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" then
					self:diffusealpha(0.5);
					self:zoomx(0);
					self:zoomy(0.5);
					self:linear(0.25);
					self:diffusealpha(0.25);
					self:zoomx(1);
					self:zoomy(1.75);
					self:linear(0.25);
					self:zoomx(0);
					self:zoomy(0.5);
					self:diffusealpha(0);
				else
					self:visible(false);
				end;
			end;
		};
		-- Double left
		LoadActor("Slim") .. {
			InitCommand=cmd(addx,-192);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" then
					self:diffusealpha(0.5);
					self:zoomx(0);
					self:zoomy(0.5);
					self:linear(0.25);
					self:diffusealpha(0.25);
					self:zoomx(1);
					self:zoomy(1.75);
					self:linear(0.25);
					self:zoomx(0);
					self:zoomy(0.5);
					self:diffusealpha(0);
				else
					self:visible(false);
				end;
			end;
		};
		-- Double right
		LoadActor("Slim") .. {
			InitCommand=cmd(addx,192);
			FullcomboCommand=function(self)
				if st == "StepsType_Dance_Double" then
					self:diffusealpha(0.5);
					self:zoomx(0);
					self:zoomy(0.5);
					self:linear(0.25);
					self:diffusealpha(0.25);
					self:zoomx(1);
					self:zoomy(1.75);
					self:linear(0.25);
					self:zoomx(0);
					self:zoomy(0.5);
					self:diffusealpha(0);
				else
					self:visible(false);
				end;
			end;
		};
	};
	
	-- Star
	LoadActor("Star") .. {
		InitCommand=cmd(blend,Blend.Add);
		FullcomboCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+152);
				self:diffusealpha(1);
				self:zoomx(0);
				self:linear(0.1);
				self:zoomx(4);
				self:zoomy(1);
				self:linear(0.12);
				self:zoomx(1);
				self:addy(-120);
				self:linear(0.36);
				self:addy(-360);
				
				self:diffusealpha(0);
				self:linear(0);
				self:addy(120);
				self:addy(360);
			else
				self:y(SCREEN_CENTER_Y-160);
				self:diffusealpha(1);
				self:zoomx(0);
				self:linear(0.1);
				self:zoomx(4);
				self:zoomy(1);
				self:linear(0.12);
				self:zoomx(1);
				self:addy(120);
				self:linear(0.36);
				self:addy(360);
				
				self:diffusealpha(0);
				self:linear(0);
				self:addy(-120);
				self:addy(-360);
			end;
		end;
	};

	-- Down gradation
	LoadActor("Down") .. {
		InitCommand=cmd(vertalign,bottom);
		FullcomboCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_TOP);
				self:diffusealpha(0);
				self:sleep(0.48);
				self:diffusealpha(0.5);
				self:zoomto(64,0);
				self:linear(0.5);
				self:zoomto(DownGradationWidth()+52,-480);
				self:linear(0.3);
				self:diffusealpha(0);
				self:zoomto(DownGradationWidth(),-480);
			else
				self:y(SCREEN_BOTTOM);
				self:diffusealpha(0);
				self:sleep(0.48);
				self:diffusealpha(0.5);
				self:zoomto(64,0);
				self:linear(0.5);
				self:zoomto(DownGradationWidth()+52,480);
				self:linear(0.3);
				self:diffusealpha(0);
				self:zoomto(DownGradationWidth(),480);
			end;
		end;
	};

	-- Left gradation
	LoadActor("Gradation") .. {
		InitCommand=cmd(vertalign,top;horizalign,right);
		FullcomboCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_BOTTOM);
				self:addx(46);
				self:zoomx(0.75);
				self:zoomy(-0.5);
				self:diffusealpha(0);
				self:sleep(0.24);
				self:diffusealpha(1);
				self:linear(0.24);
				self:zoomy(-1);
				
				self:linear(0.5);
				self:zoomx(1);
				self:addx(-14);
				self:linear(0.1);
				self:addx(-28);
				self:linear(0.2);
				self:addx(-GradationWidth()*128-64);
				self:diffusealpha(0);
				
				self:linear(0);
				self:addx(-46);
				self:addx(14);
				self:addx(28);
				self:addx(GradationWidth()*128+64);
			else
				self:y(SCREEN_TOP);
				self:addx(46);
				self:zoomx(0.75);
				self:zoomy(0.5);
				self:diffusealpha(0);
				self:sleep(0.24);
				self:diffusealpha(1);
				self:linear(0.24);
				self:zoomy(1);
				
				self:linear(0.5);
				self:zoomx(1);
				self:addx(-14);
				self:linear(0.1);
				self:addx(-28);
				self:linear(0.2);
				self:addx(-GradationWidth()*128-64);
				self:diffusealpha(0);
				
				self:linear(0);
				self:addx(-46);
				self:addx(14);
				self:addx(28);
				self:addx(GradationWidth()*128+64);
			end;
		end;
	};
	
	-- Right gradation
	LoadActor("Gradation") .. {
		InitCommand=cmd(vertalign,top;horizalign,right);
		FullcomboCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_BOTTOM);
				self:addx(-46);
				self:zoomx(-0.75);
				self:zoomy(-0.5);
				self:diffusealpha(0);
				self:sleep(0.24);
				self:diffusealpha(1);
				self:linear(0.24);
				self:zoomy(-1);
				
				self:linear(0.5);
				self:zoomx(-1);
				self:addx(14);
				self:linear(0.1);
				self:addx(28);
				self:linear(0.2);
				self:addx(GradationWidth()*128+64);
				self:diffusealpha(0);
				
				self:linear(0);
				self:addx(46);
				self:addx(-14);
				self:addx(-28);
				self:addx(-GradationWidth()*128-64);
			else
				self:y(SCREEN_TOP);
				self:addx(-46);
				self:zoomx(-0.75);
				self:zoomy(0.5);
				self:diffusealpha(0);
				self:sleep(0.24);
				self:diffusealpha(1);
				self:linear(0.24);
				self:zoomy(1);
				
				self:linear(0.5);
				self:zoomx(-1);
				self:addx(14);
				self:linear(0.1);
				self:addx(28);
				self:linear(0.2);
				self:addx(GradationWidth()*128+64);
				self:diffusealpha(0);
				
				self:linear(0);
				self:addx(46);
				self:addx(-14);
				self:addx(-28);
				self:addx(-GradationWidth()*128-64);
			end;
		end;
	};

	-- Double only left gradation2
	LoadActor("Gradation") .. {
		InitCommand=cmd(horizalign,right);
		FullcomboCommand=function(self)
			if st == "StepsType_Dance_Double" then
				self:y(SCREEN_CENTER_Y);
				self:addx(46);
				self:diffusealpha(0);
				self:zoomx(0.75);
				self:sleep(0.98);
				self:linear(0.1);
				self:diffusealpha(1);
				self:zoomx(1);
				self:addx(-14);
				self:linear(0.1);
				self:addx(-28);
				self:linear(0.2);
				self:addx(-GradationWidth()*128-64);
				self:diffusealpha(0);
				
				self:linear(0);
				self:addx(-46);
				self:addx(14);
				self:addx(28);
				self:addx(GradationWidth()*128+64);
			else
				self:visible(false);
			end;
		end;
	};

	-- Double only right gradation2
	LoadActor("Gradation") .. {
		InitCommand=cmd(horizalign,right);
		FullcomboCommand=function(self)
			if st == "StepsType_Dance_Double" then
				self:y(SCREEN_CENTER_Y);
				self:addx(-46);
				self:diffusealpha(0);
				self:zoomx(-0.75);
				self:sleep(0.98);
				self:linear(0.1);
				self:diffusealpha(1);
				self:zoomx(-1);
				self:addx(14);
				self:linear(0.1);
				self:addx(28);
				self:linear(0.2);
				self:addx(GradationWidth()*128+64);
				self:diffusealpha(0);
				
				self:linear(0);
				self:addx(46);
				self:addx(-14);
				self:addx(-28);
				self:addx(-GradationWidth()*128-64);
			else
				self:visible(false);
			end;
		end;
	};

	-- Ring star
	LoadActor( "Star" ) .. {
		InitCommand=function(self)
			self:zoom(0);
			self:blend(Blend.Add);
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+57);
			else
				self:y(SCREEN_CENTER_Y-65);
			end;
		end;
		FullcomboCommand=function(self)
			self:sleep(0.65);
			self:diffusealpha(1);
			self:zoomx(2);
			self:zoomy(0);
			self:linear(0.1);
			self:zoomy(2);
			self:rotationz(0);
			self:linear(0.5);
			self:zoom(1.2);
			self:diffusealpha(0.4);
			self:rotationz(90);
			self:linear(0.05);
			self:diffusealpha(0);
			self:linear(0);
			self:zoom(0);
		end;
	};
};

-- Ring
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,GetPosition(pn);diffusealpha,0);
	FullcomboCommand=cmd(diffusealpha,1);
	-- Ring star highlight
	LoadActor( "SStar" ) .. {
		InitCommand=function(self)
			self:zoom(0);
			self:blend(Blend.Add);
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+57);
			else
				self:y(SCREEN_CENTER_Y-65);
			end;
		end;
		FullcomboCommand=function(self)
			self:diffuse(color("#ffffff"));
			self:sleep(0.65);
			self:diffusealpha(0.8);
			self:zoomx(2);
			self:zoomy(0);
			self:linear(0.1);
			self:zoomy(2);
			self:rotationz(0);
			self:linear(0.5);
			self:zoom(1.2);
			self:rotationz(90);
			self:diffusealpha(0.4);
			self:linear(0.05);
			self:diffusealpha(0);
			self:linear(0);
			self:zoom(0);
		end;
	};
	-- Ring
	LoadActor( "Fullcombo01" ) .. {
		InitCommand=function(self)
			self:zoom(0);
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+57);
			else
				self:y(SCREEN_CENTER_Y-65);
			end;
		end;
		FullcomboCommand=function(self)
			self:diffuse(GetRingColor());
			self:sleep(0.65);
			self:zoomx(2);
			self:zoomy(0);
			self:linear(0.1);
			self:zoomy(2);
			self:rotationz(0);
			self:linear(0.5);
			self:zoom(1.2);
			self:rotationz(90);
			self:linear(0.15);
			self:zoomy(0);
			self:zoomx(0.5);
			self:diffusealpha(0);
		end;
	};
	-- Ring bar
	LoadActor( "Fullcombo02" ) .. {
		InitCommand=function(self)
			self:zoom(0);
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_CENTER_Y+57);
			else
				self:y(SCREEN_CENTER_Y-65);
			end;
		end;
		FullcomboCommand=function(self)
			self:diffuse(GetRingColor());
			self:sleep(0.65);
			self:zoomx(4);
			self:zoomy(0);
			self:linear(0.1);
			self:zoomy(4);
			self:rotationz(0);
			self:linear(0.5);
			self:zoom(1.25);
			self:rotationz(-90);
			self:linear(0.15);
			self:zoomy(0);
			self:zoomx(0.5);
			self:diffusealpha(0);
		end;
	};
};

-- Star highlight
t[#t+1] = LoadActor("SStar") .. {
	InitCommand=cmd(x,GetPosition(pn);diffusealpha,0;blend,Blend.Add);
	FullcomboCommand=function(self)
		if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
			self:y(SCREEN_CENTER_Y+152);
			self:diffusealpha(0.95);
			self:zoomx(0);
			self:linear(0.1);
			self:zoomx(4);
			self:zoomy(1);
			self:linear(0.12);
			self:zoomx(1);
			self:addy(-120);
			self:linear(0.36);
			self:addy(-360);
			
			self:linear(0);
			self:addy(120);
			self:addy(360);
			self:diffusealpha(0);
		else
			self:y(SCREEN_CENTER_Y-160);
			self:diffusealpha(0.95);
			self:zoomx(0);
			self:linear(0.1);
			self:zoomx(4);
			self:zoomy(1);
			self:linear(0.12);
			self:zoomx(1);
			self:addy(120);
			self:linear(0.36);
			self:addy(360);
			
			self:linear(0);
			self:addy(-120);
			self:addy(-360);
			self:diffusealpha(0);
		end;
	end;
};

-- FullCombo text picture
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
		self:x(GetPosition(pn));
		self:diffusealpha(0);
		if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
			self:y(SCREEN_CENTER_Y+57);
		else
			self:y(SCREEN_CENTER_Y-65);
		end;
	end;
	FullcomboCommand=function(self)
		if w2[p] + w3[p] + w4[p] == 0 then
			if bComboGraphic == 'x3' or bComboGraphic == '2013' then
				if GetScreenAspectRatio() > 1.7 then
					self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X3_Marvelous_FullCombo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X3_Marvelous2_FullCombo"));
				end;
			elseif bComboGraphic == 'x2' then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X2_Marvelous_FullCombo"));
			else
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_Marvelous_FullCombo"));
			end;
		elseif w3[p] + w4[p] == 0 then
			if bComboGraphic == 'x3' or bComboGraphic == '2013' then
				if GetScreenAspectRatio() > 1.7 then
					self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X3_Perfect_FullCombo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X3_Perfect2_FullCombo"));
				end;
			elseif bComboGraphic == 'x2' then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X2_Perfect_FullCombo"));
			else
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_Perfect_FullCombo"));
			end;
		elseif w4[p] == 0 then
			if bComboGraphic == 'x3' or bComboGraphic == '2013' then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X3_Great_FullCombo"));
			elseif bComboGraphic == 'x2' then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X2_Great_FullCombo"));
			else
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_Great_FullCombo"));
			end;
		else
			if bComboGraphic == 'x3' or bComboGraphic == '2013' then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X3_Good_FullCombo"));
			elseif bComboGraphic == 'x2' then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_X2_Good_FullCombo"));
			else
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/Text_Good_FullCombo"));
			end;
		end;
		self:sleep(0.6);
		self:diffusealpha(1);
		self:zoomy(0);
		self:linear(0.1);
		self:zoom(TextZoom());
		self:linear(0.5);
		self:zoom(TextZoom()*1.15);
		self:linear(0.05);
		self:diffusealpha(0.66);
		self:zoomx(TextZoom()*1.165);
		self:linear(0.1);
		self:zoomy(0);
		self:zoomx(TextZoom()*1.195);
		self:diffusealpha(0);
	end;
};

return t;