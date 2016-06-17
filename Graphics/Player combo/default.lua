-- Base from default
-- FullCombo color from waiei by A.C

local t = Def.ActorFrame {}
local c;
local c2;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");

local Pulse = THEME:GetMetric("Combo", "2013_PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "2013_PulseLabelCommand");
local lsatWorstJudge={0,0};
local p=((player=='PlayerNumber_P1') and 1 or 2);

local pname = ToEnumShortString(player);
local profileGUID = PROFILEMAN:GetProfile(player):GetGUID();

local style = GAMESTATE:GetCurrentStyle():GetStyleType()
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local IsUsingCenter1Player = PREFSMAN:GetPreference('Center1Player');

local noplayer;
if GAMESTATE:IsDemonstration() or (not GAMESTATE:IsSideJoined(player) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave') then
	noplayer = true;
else
	noplayer = false;
end;
--[[ STRIDER MODIF
-- ScreenFilter
local bScreenFilter = ScreenFilter(player);

local tokimeki;
if bScreenFilter == "TOKIMEKI MIYUKI" or bScreenFilter == "TOKIMEKI KAORI" or bScreenFilter == "TOKIMEKI MIHO" or bScreenFilter == "TOKIMEKI MAHO" then
	tokimeki = true;
else
	tokimeki = false;
end;]]--

-- ComboGraphic
local bComboGraphic = ComboGraphic(player);
-- Popup


local PulsePlayer = THEME:GetMetric( "Combo", bComboGraphic.."_PulseCommand" );
local PulseLabelPlayer = THEME:GetMetric("Combo", bComboGraphic.."_PulseLabelCommand");


local function fontPathW1()
	if noplayer then
	return THEME:GetPathG("","Player combo/Combo/Combo default_W2.ini");
		--return THEME:GetPathG("","Player combo/Combo/Combo 2013_W1.ini");
	elseif bComboGraphic == 'default'
--	elseif bComboGraphic == '2013'
		or bComboGraphic == 'x1' 
		or bComboGraphic == 'x2' 
		or bComboGraphic == 'x3' 
		or bComboGraphic == '2013' then
		return THEME:GetPathG("","Player combo/Combo/Combo ".. bComboGraphic .. "_W1.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W1.ini");
	else
		return THEME:GetPathG("","Player combo/Combo/Combo off.ini");
	end;
end;

local function fontPathW2()
	if noplayer then
	return THEME:GetPathG("","Player combo/Combo/Combo default_W2.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W2.ini");
	elseif bComboGraphic == 'default'
		or bComboGraphic == 'x1' 
		or bComboGraphic == 'x2' 
		or bComboGraphic == 'x3' 
		or bComboGraphic == '2013' then
		return THEME:GetPathG("","Player combo/Combo/Combo ".. bComboGraphic .. "_W2.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W2.ini");
	else
		return THEME:GetPathG("","Player combo/Combo/Combo off.ini");
	end;
end;

local function fontPathW3()
	if noplayer then
		return THEME:GetPathG("","Player combo/Combo/Combo default_W3.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W3.ini");
	elseif bComboGraphic == 'default'
		or bComboGraphic == 'x1' 
		or bComboGraphic == 'x2' 
		or bComboGraphic == 'x3' 
		or bComboGraphic == '2013' then
		return THEME:GetPathG("","Player combo/Combo/Combo ".. bComboGraphic .. "_W3.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W3.ini");
	else
		return THEME:GetPathG("","Player combo/Combo/Combo off.ini");
	end;
end;

local function fontPathW4()
	if noplayer then
		return THEME:GetPathG("","Player combo/Combo/Combo default_W4.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W4.ini");
	elseif bComboGraphic == 'default'
		or bComboGraphic == 'x1' 
		or bComboGraphic == 'x2' 
		or bComboGraphic == 'x3' 
		or bComboGraphic == '2013' then
		return THEME:GetPathG("","Player combo/Combo/Combo ".. bComboGraphic .. "_W4.ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W4.ini");
	elseif bComboGraphic == 'extreme' then
		return THEME:GetPathG("","Player combo/Combo/Combo max.ini");
	else
		return THEME:GetPathG("","Player combo/Combo/Combo ".. bComboGraphic .. ".ini");
--		return THEME:GetPathG("","Player combo/Combo/Combo 2013_W4.ini");
	end;
end;

local function GetNumberY()
	local y=0;
	if noplayer then
		y=(2);
	else
		if bComboGraphic == 'default' then
--			y=(3);
			y=(4);
		elseif bComboGraphic == '1st' then
			y=(2);
		elseif bComboGraphic == '3rd' then
			y=(2);
		elseif bComboGraphic == '5th' then
			y=(1);
		elseif bComboGraphic == 'max' then
			y=(1);
		elseif bComboGraphic == 'extreme' then
			y=(2);
		elseif bComboGraphic == 'supernova1' then
			y=(-1)
		elseif bComboGraphic == 'supernova2' then
			y=(2)
		elseif bComboGraphic == 'x1' then
			y=(6)
		elseif bComboGraphic == 'x2' then
			y=(4);
		elseif bComboGraphic == 'x3' then
			y=(9);
		elseif bComboGraphic == '2013' then
			y=(4);
		end;
	end;
	return y;
end;

t[#t+1]=Def.ActorFrame {
	Def.BitmapText {
		File = fontPathW1();
		Name="NumberW1";
		InitCommand=function(self)
			self:y(GetNumberY());
		end;
		OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
	};
	Def.BitmapText {
		File = fontPathW2();
		Name="NumberW2";
		InitCommand=function(self)
			self:y(GetNumberY());
		end;
		OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
	};
	Def.BitmapText {
		File = fontPathW3();
		Name="NumberW3";
		InitCommand=function(self)
			self:y(GetNumberY());
		end;
		OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
	};
	Def.BitmapText {
		File = fontPathW4();
		Name="NumberW4";
		InitCommand=function(self)
			self:y(GetNumberY());
		end;
		OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
	};
	
	Def.Sprite {
		Name="Label";
		InitCommand=function(self)
			if noplayer then
				self:Load(THEME:GetPathG("","Player combo/Label/Label_default"));
--				self:Load(THEME:GetPathG("","Player combo/Label/Label_2013"));
			else
				self:Load(THEME:GetPathG("","Player combo/Label/Label_".. bComboGraphic));
--				self:Load(THEME:GetPathG("","Player combo/Label/Label_2013"));
			end;
			self:animate(false);
			self:setstate(0);
		end;
		OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
	};
	
	InitCommand = function(self)
		c = self:GetChildren();
		c.NumberW1:visible(false);
		c.NumberW2:visible(false);
		c.NumberW3:visible(false);
		c.NumberW4:visible(false);
		c.Label:visible(false);
		lsatWorstJudge[p]=0;
	end;

	JudgmentMessageCommand = function(self,params)
		if params.Player ~= player then return end;
		if params.TapNoteScore=='TapNoteScore_W1' and lsatWorstJudge[p]<1 then
			lsatWorstJudge[p]=1;
		elseif params.TapNoteScore=='TapNoteScore_W2' and lsatWorstJudge[p]<2 then
			lsatWorstJudge[p]=2;
		elseif params.TapNoteScore=='TapNoteScore_W3' and lsatWorstJudge[p]<3 then
			lsatWorstJudge[p]=3;
		elseif params.TapNoteScore=='TapNoteScore_W4' and lsatWorstJudge[p]<4 then
			lsatWorstJudge[p]=4;
		elseif params.TapNoteScore=='TapNoteScore_CheckpointMiss' 
			or params.TapNoteScore=='TapNoteScore_W5' 
			or params.TapNoteScore=='TapNoteScore_Miss' then
			lsatWorstJudge[p]=1;
		end;
	end;

	ComboCommand=function(self,params)
		local iCombo = params.Combo;
		if not iCombo or iCombo < ShowComboAt then
			c.NumberW1:visible(false);
			c.NumberW2:visible(false);
			c.NumberW3:visible(false);
			c.NumberW4:visible(false);
			c.Label:visible(false);
			return;
		end
		self:finishtweening();
		
		c.NumberW1:settextf( string.format("%i", iCombo) );
		c.NumberW2:settextf( string.format("%i", iCombo) );
		c.NumberW3:settextf( string.format("%i", iCombo) );
		c.NumberW4:settextf( string.format("%i", iCombo) );
		c.NumberW1:visible(false);
		c.NumberW2:visible(false);
		c.NumberW3:visible(false);
		c.NumberW4:visible(true);
		c.Label:visible(true);
	
	--	消さない
	--	params.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
	--	params.Zoom = clamp( params.Zoom, NumberMinZoom, NumberMaxZoom );
	--	params.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, LabelMaxZoom );
	--	params.LabelZoom = clamp( params.LabelZoom, LabelMinZoom, LabelMaxZoom );
	
		params.LabelZoom = scale( iCombo, 0, 4, 1, 1 );
		params.LabelZoom = clamp( params.LabelZoom, 1, 1 );
			
		local NumberX = 0;
		if noplayer or bComboGraphic == 'default' then
----------------------- default ------------------------------		
			if iCombo > 9999 then
				NumberX = 40
				c.Label:x(42);
				c.NumberW1:y(5);
				c.NumberW2:y(5);
				c.NumberW3:y(5);
				c.NumberW4:y(5);
				params.Zoom = scale( iCombo, 0, 1, 1.5, 1.5 );
				params.Zoom = clamp( params.Zoom, 1.5, 1.5 );
			elseif iCombo > 999 then
				NumberX = 23
				c.Label:x(25);
				c.NumberW1:y(5);
				c.NumberW2:y(5);
				c.NumberW3:y(5);
				c.NumberW4:y(5);
				params.Zoom = scale( iCombo, 0, 1, 1.5, 1.5 );
				params.Zoom = clamp( params.Zoom, 1.5, 1.5 );
			elseif iCombo > 99 then
				NumberX = 5
				c.Label:x(7);
				c.NumberW1:y(5);
				c.NumberW2:y(5);
				c.NumberW3:y(5);
				c.NumberW4:y(5);
				params.Zoom = scale( iCombo, 0, 1, 1.5, 1.5 );
				params.Zoom = clamp( params.Zoom, 1.5, 1.5 );
			elseif iCombo > 89 then
				NumberX = -13
				c.Label:x(-11);
				c.NumberW1:y(4.8);
				c.NumberW2:y(4.8);
				c.NumberW3:y(4.8);
				c.NumberW4:y(4.8);
				params.Zoom = scale( iCombo, 0, 1, 1.45, 1.45 );
				params.Zoom = clamp( params.Zoom, 1.45, 1.45 );
			elseif iCombo > 79 then
				NumberX = -14
				c.Label:x(-12);
				c.NumberW1:y(4.6);
				c.NumberW2:y(4.6);
				c.NumberW3:y(4.6);
				c.NumberW4:y(4.6);
				params.Zoom = scale( iCombo, 0, 1, 1.4, 1.4 );
				params.Zoom = clamp( params.Zoom, 1.4, 1.4 );
			elseif iCombo > 69 then
				NumberX = -15
				c.Label:x(-13);
				c.NumberW1:y(4.4);
				c.NumberW2:y(4.4);
				c.NumberW3:y(4.4);
				c.NumberW4:y(4.4);
				params.Zoom = scale( iCombo, 0, 1, 1.35, 1.35 );
				params.Zoom = clamp( params.Zoom, 1.35, 1.35 );
			elseif iCombo > 59 then
				NumberX = -16
				c.Label:x(-14);
				c.NumberW1:y(4.2);
				c.NumberW2:y(4.2);
				c.NumberW3:y(4.2);
				c.NumberW4:y(4.2);
				params.Zoom = scale( iCombo, 0, 1, 1.3, 1.3 );
				params.Zoom = clamp( params.Zoom, 1.3, 1.3 );
			elseif iCombo > 49 then
				NumberX = -17
				c.Label:x(-15);
				c.NumberW1:y(4);
				c.NumberW2:y(4);
				c.NumberW3:y(4);
				c.NumberW4:y(4);
				params.Zoom = scale( iCombo, 0, 1, 1.25, 1.25 );
				params.Zoom = clamp( params.Zoom, 1.25, 1.25 );
			elseif iCombo > 39 then
				NumberX = -19
				c.Label:x(-17);
				c.NumberW1:y(3.8);
				c.NumberW2:y(3.8);
				c.NumberW3:y(3.8);
				c.NumberW4:y(3.8);
				params.Zoom = scale( iCombo, 0, 1, 1.2, 1.2 );
				params.Zoom = clamp( params.Zoom, 1.2, 1.2 );
			elseif iCombo > 29 then
				NumberX = -20
				c.Label:x(-18);
				c.NumberW1:y(3.6);
				c.NumberW2:y(3.6);
				c.NumberW3:y(3.6);
				c.NumberW4:y(3.6);
				params.Zoom = scale( iCombo, 0, 1, 1.15, 1.15 );
				params.Zoom = clamp( params.Zoom, 1.15, 1.15 );
			elseif iCombo > 19 then
				NumberX = -21
				c.Label:x(-19);
				c.NumberW1:y(3.4);
				c.NumberW2:y(3.4);
				c.NumberW3:y(3.4);
				c.NumberW4:y(3.4);
				params.Zoom = scale( iCombo, 0, 1, 1.1, 1.1 );
				params.Zoom = clamp( params.Zoom, 1.1, 1.1 );
			elseif iCombo > 9 then
				NumberX = -22
				c.Label:x(-20);
				c.NumberW1:y(3.2);
				c.NumberW2:y(3.2);
				c.NumberW3:y(3.2);
				c.NumberW4:y(3.2);
				params.Zoom = scale( iCombo, 0, 1, 1.05, 1.05 );
				params.Zoom = clamp( params.Zoom, 1.05, 1.05 );
			else
				NumberX = -35
				c.Label:x(-33);
				c.NumberW1:y(3);
				c.NumberW2:y(3);
				c.NumberW3:y(3);
				c.NumberW4:y(3);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			end;
			if lsatWorstJudge[p]==1 then
				c.NumberW1:visible(true);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(3);
			elseif lsatWorstJudge[p]==2 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(true);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(2);
			elseif lsatWorstJudge[p]==3 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(true);
				c.NumberW4:visible(false);
				c.Label:setstate(1);
			elseif lsatWorstJudge[p]==4 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(true);
				c.Label:setstate(0);
			end;
------------------------------------------------------ 2013--- param
			c.Label:y(3);
			if iCombo > 9999 then
				NumberX = 41
				c.Label:x(45);
				params.Zoom = scale( iCombo, 0, 1, 0.79, 0.79 );
				params.Zoom = clamp( params.Zoom, 0.79, 0.79 );
			elseif iCombo > 999 then
				NumberX = 33
				c.Label:x(37);
				params.Zoom = scale( iCombo, 0, 1, 0.9, 0.9 );
				params.Zoom = clamp( params.Zoom, 0.9, 0.9 );
			elseif iCombo > 99 then
				NumberX = 22
				c.Label:x(26);
				params.Zoom = scale( iCombo, 0, 1, 1.03, 1.03 );
				params.Zoom = clamp( params.Zoom, 1.03, 1.03 );
			elseif iCombo > 89 then
				NumberX = 4
				c.Label:x(8);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			elseif iCombo > 79 then
				NumberX = 2
				c.Label:x(6);
				params.Zoom = scale( iCombo, 0, 1, 0.97, 0.97 );
				params.Zoom = clamp( params.Zoom, 0.97, 0.97 );
			elseif iCombo > 69 then
				NumberX = 0
				c.Label:x(4);
				params.Zoom = scale( iCombo, 0, 1, 0.94, 0.94 );
				params.Zoom = clamp( params.Zoom, 0.94, 0.94 );
			elseif iCombo > 59 then
				NumberX = -2
				c.Label:x(2);
				params.Zoom = scale( iCombo, 0, 1, 0.91, 0.91 );
				params.Zoom = clamp( params.Zoom, 0.91, 0.91 );
			elseif iCombo > 49 then
				NumberX = -4
				c.Label:x(0);
				params.Zoom = scale( iCombo, 0, 1, 0.88, 0.88 );
				params.Zoom = clamp( params.Zoom, 0.88, 0.88 );
			elseif iCombo > 39 then
				NumberX = -6
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 0.85, 0.85 );
				params.Zoom = clamp( params.Zoom, 0.85, 0.85 );
			elseif iCombo > 29 then
				NumberX = -8
				c.Label:x(-4);
				params.Zoom = scale( iCombo, 0, 1, 0.82, 0.82 );
				params.Zoom = clamp( params.Zoom, 0.82, 0.82 );
			elseif iCombo > 19 then
				NumberX = -10
				c.Label:x(-6);
				params.Zoom = scale( iCombo, 0, 1, 0.79, 0.79 );
				params.Zoom = clamp( params.Zoom, 0.79, 0.79 );
			elseif iCombo > 9 then
				NumberX = -12
				c.Label:x(-8);
				params.Zoom = scale( iCombo, 0, 1, 0.76, 0.76 );
				params.Zoom = clamp( params.Zoom, 0.76, 0.76 );
			else
				NumberX = -19
				c.Label:x(-15);
				params.Zoom = scale( iCombo, 0, 1, 0.73, 0.73 );
				params.Zoom = clamp( params.Zoom, 0.73, 0.73 );
			end;
			if lsatWorstJudge[p]==1 then
				c.NumberW1:visible(true);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(3);
			elseif lsatWorstJudge[p]==2 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(true);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(2);
			elseif lsatWorstJudge[p]==3 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(true);
				c.NumberW4:visible(false);
				c.Label:setstate(1);
			elseif lsatWorstJudge[p]==4 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(true);
				c.Label:setstate(0);
			end;
-------------------- ddr1st --------------------------			
		elseif bComboGraphic == '1st' then
			if iCombo > 9999 then
				NumberX = 40
				c.Label:x(41);
			elseif iCombo > 999 then
				NumberX = 23
				c.Label:x(24);
			else
				NumberX = -1
				c.Label:x(0);
			end;
			params.Zoom = scale( iCombo, 4, 100, 1, 1.5 );
			params.Zoom = clamp( params.Zoom, 1, 1.5 );
----------------------- 3rd ---------------------------			
		elseif bComboGraphic == '3rd' then
			if iCombo > 9999 then
				NumberX = 33
				c.Label:x(36);
			elseif iCombo > 999 then
				NumberX = 16
				c.Label:x(19);
			else
				NumberX = 1
				c.Label:x(4);
			end;
			params.Zoom = scale( iCombo, 4, 100, 1, 1.5 );
			params.Zoom = clamp( params.Zoom, 1, 1.5 );
------------------------- 5th-----------------------------			
		elseif bComboGraphic == '5th' then
			if iCombo > 9999 then
				NumberX = 41
				c.Label:x(44);
			elseif iCombo > 999 then
				NumberX = 24
				c.Label:x(27);
			else
				NumberX = 1
				c.Label:x(4);
			end;
			params.Zoom = scale( iCombo, 4, 100, 1, 1.5 );
			params.Zoom = clamp( params.Zoom, 1, 1.5 );
		elseif bComboGraphic == 'max' then
			if iCombo > 9999 then
				NumberX = 22
				c.Label:x(26);
				params.Zoom = scale( iCombo, 0, 1, 0.83, 0.83 );
				params.Zoom = clamp( params.Zoom, 0.83, 0.83 );
			elseif iCombo > 999 then
				NumberX = 0
				c.Label:x(4);
				params.Zoom = scale( iCombo, 0, 1, 0.83, 0.83 );
				params.Zoom = clamp( params.Zoom, 0.83, 0.83 );
			else
				NumberX = 0
				c.Label:x(4);
				params.Zoom = scale( iCombo, 4, 100, 0.66, 1 );
				params.Zoom = clamp( params.Zoom, 0.66, 1 );
			end;
		elseif bComboGraphic == 'extreme' then
			if iCombo > 9999 then
				NumberX = 13
				c.Label:x(17);
				params.Zoom = scale( iCombo, 0, 100, 0.83, 0.83 );
				params.Zoom = clamp( params.Zoom, 0.83, 0.83 );
			elseif iCombo > 999 then
				NumberX = 0
				c.Label:x(4);
				params.Zoom = scale( iCombo, 0, 100, 0.83, 0.83 );
				params.Zoom = clamp( params.Zoom, 0.83, 0.83 );
			else
				NumberX = 0
				c.Label:x(4);
				params.Zoom = scale( iCombo, 4, 100, 0.66, 1 );
				params.Zoom = clamp( params.Zoom, 0.66, 1 );
			end;
		elseif bComboGraphic == 'supernova1' then
			if iCombo > 9999 then
				NumberX = 47
				c.Label:x(51);
				params.Zoom = scale( iCombo, 0, 100, 0.86, 0.86 );
				params.Zoom = clamp( params.Zoom, 0.86, 0.86 );
			elseif iCombo > 999 then
				NumberX = 29
				c.Label:x(33);
				params.Zoom = scale( iCombo, 0, 100, 0.86, 0.86 );
				params.Zoom = clamp( params.Zoom, 0.86, 0.86 );
			elseif iCombo > 99 then
				NumberX = 21
				c.Label:x(25);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			elseif iCombo > 89 then
				NumberX = -5
				c.Label:x(-1);
				params.Zoom = scale( iCombo, 0, 1, 0.97, 0.97 );
				params.Zoom = clamp( params.Zoom, 0.97, 0.97 );
			elseif iCombo > 79 then
				NumberX = -6
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 0.93, 0.93 );
				params.Zoom = clamp( params.Zoom, 0.93, 0.93 );
			elseif iCombo > 69 then
				NumberX = -7
				c.Label:x(-3);
				params.Zoom = scale( iCombo, 0, 1, 0.9, 0.9 );
				params.Zoom = clamp( params.Zoom, 0.9, 0.9 );
			elseif iCombo > 59 then
				NumberX = -8
				c.Label:x(-4);
				params.Zoom = scale( iCombo, 0, 1, 0.87, 0.87 );
				params.Zoom = clamp( params.Zoom, 0.87, 0.87 );
			elseif iCombo > 49 then
				NumberX = -9
				c.Label:x(-5);
				params.Zoom = scale( iCombo, 0, 1, 0.83, 0.83 );
				params.Zoom = clamp( params.Zoom, 0.83, 0.83 );
			elseif iCombo > 39 then
				NumberX = -10
				c.Label:x(-6);
				params.Zoom = scale( iCombo, 0, 1, 0.8, 0.8 );
				params.Zoom = clamp( params.Zoom, 0.8, 0.8 );
			elseif iCombo > 29 then
				NumberX = -11
				c.Label:x(-7);
				params.Zoom = scale( iCombo, 0, 1, 0.77, 0.77 );
				params.Zoom = clamp( params.Zoom, 0.77, 0.77 );
			elseif iCombo > 19 then
				NumberX = -12
				c.Label:x(-8);
				params.Zoom = scale( iCombo, 0, 1, 0.73, 0.73 );
				params.Zoom = clamp( params.Zoom, 0.73, 0.73 );
			elseif iCombo > 9 then
				NumberX = -13
				c.Label:x(-9);
				params.Zoom = scale( iCombo, 0, 1, 0.7, 0.7 );
				params.Zoom = clamp( params.Zoom, 0.7, 0.7 );
			else
				NumberX = -27.5
				c.Label:x(-23.5);
				params.Zoom = scale( iCombo, 0, 1, 0.66, 0.66 );
				params.Zoom = clamp( params.Zoom, 0.66, 0.66 );
			end;
		elseif bComboGraphic == 'supernova2' then
			if iCombo > 9999 then
				NumberX = 46
				c.Label:x(49);
				params.Zoom = scale( iCombo, 0, 100, 0.86, 0.86 );
				params.Zoom = clamp( params.Zoom, 0.86, 0.86 );
			elseif iCombo > 999 then
				NumberX = 28
				c.Label:x(31);
				params.Zoom = scale( iCombo, 0, 1, 0.86, 0.86 );
				params.Zoom = clamp( params.Zoom, 0.86, 0.86 );
			elseif iCombo > 99 then
				NumberX = 21
				c.Label:x(24);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			elseif iCombo > 89 then
				NumberX = -5
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 0.97, 0.97 );
				params.Zoom = clamp( params.Zoom, 0.97, 0.97 );
			elseif iCombo > 79 then
				NumberX = -6
				c.Label:x(-3);
				params.Zoom = scale( iCombo, 0, 1, 0.93, 0.93 );
				params.Zoom = clamp( params.Zoom, 0.93, 0.93 );
			elseif iCombo > 69 then
				NumberX = -7
				c.Label:x(-4);
				params.Zoom = scale( iCombo, 0, 1, 0.9, 0.9 );
				params.Zoom = clamp( params.Zoom, 0.9, 0.9 );
			elseif iCombo > 59 then
				NumberX = -8
				c.Label:x(-5);
				params.Zoom = scale( iCombo, 0, 1, 0.87, 0.87 );
				params.Zoom = clamp( params.Zoom, 0.87, 0.87 );
			elseif iCombo > 49 then
				NumberX = -9
				c.Label:x(-6);
				params.Zoom = scale( iCombo, 0, 1, 0.83, 0.83 );
				params.Zoom = clamp( params.Zoom, 0.83, 0.83 );
			elseif iCombo > 39 then
				NumberX = -11
				c.Label:x(-8);
				params.Zoom = scale( iCombo, 0, 1, 0.8, 0.8 );
				params.Zoom = clamp( params.Zoom, 0.8, 0.8 );
			elseif iCombo > 29 then
				NumberX = -12
				c.Label:x(-9);
				params.Zoom = scale( iCombo, 0, 1, 0.77, 0.77 );
				params.Zoom = clamp( params.Zoom, 0.77, 0.77 );
			elseif iCombo > 19 then
				NumberX = -13
				c.Label:x(-10);
				params.Zoom = scale( iCombo, 0, 1, 0.73, 0.73 );
				params.Zoom = clamp( params.Zoom, 0.73, 0.73 );
			elseif iCombo > 9 then
				NumberX = -14
				c.Label:x(-11);
				params.Zoom = scale( iCombo, 0, 1, 0.7, 0.7 );
				params.Zoom = clamp( params.Zoom, 0.7, 0.7 );
			else
				NumberX = -29
				c.Label:x(-26);
				params.Zoom = scale( iCombo, 0, 1, 0.66, 0.66 );
				params.Zoom = clamp( params.Zoom, 0.66, 0.66 );
			end;
		elseif bComboGraphic == 'x1' then
			if iCombo > 9999 then
				NumberX = 36
				c.Label:x(41);
				params.Zoom = scale( iCombo, 0, 1, 1.06, 1.06 );
				params.Zoom = clamp( params.Zoom, 1.06, 1.06 );
			elseif iCombo > 999 then
				NumberX = 31
				c.Label:x(36);
				params.Zoom = scale( iCombo, 0, 1, 1.25, 1.25 );
				params.Zoom = clamp( params.Zoom, 1.25, 1.25 );
			elseif iCombo > 99 then
				NumberX = 21
				c.Label:x(26);
				params.Zoom = scale( iCombo, 0, 1, 1, 1.5 );
				params.Zoom = clamp( params.Zoom, 1, 1.5 );
			elseif iCombo > 89 then
				NumberX = -7
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 1.45, 1.45 );
				params.Zoom = clamp( params.Zoom, 1.45, 1.45 );
			elseif iCombo > 79 then
				NumberX = -8
				c.Label:x(-3);
				params.Zoom = scale( iCombo, 0, 1, 1.4, 1.4 );
				params.Zoom = clamp( params.Zoom, 1.4, 1.4 );
			elseif iCombo > 69 then
				NumberX = -9
				c.Label:x(-4);
				params.Zoom = scale( iCombo, 0, 1, 1.35, 1.35 );
				params.Zoom = clamp( params.Zoom, 1.35, 1.35 );
			elseif iCombo > 59 then
				NumberX = -10
				c.Label:x(-5);
				params.Zoom = scale( iCombo, 0, 1, 1.3, 1.3 );
				params.Zoom = clamp( params.Zoom, 1.3, 1.3 );
			elseif iCombo > 49 then
				NumberX = -12
				c.Label:x(-7);
				params.Zoom = scale( iCombo, 0, 1, 1.25, 1.25 );
				params.Zoom = clamp( params.Zoom, 1.25, 1.25 );
			elseif iCombo > 39 then
				NumberX = -13
				c.Label:x(-8);
				params.Zoom = scale( iCombo, 0, 1, 1.2, 1.2 );
				params.Zoom = clamp( params.Zoom, 1.2, 1.2 );
			elseif iCombo > 29 then
				NumberX = -14
				c.Label:x(-9);
				params.Zoom = scale( iCombo, 0, 1, 1.15, 1.15 );
				params.Zoom = clamp( params.Zoom, 1.15, 1.15 );
			elseif iCombo > 19 then
				NumberX = -15
				c.Label:x(-10);
				params.Zoom = scale( iCombo, 0, 1, 1.1, 1.1 );
				params.Zoom = clamp( params.Zoom, 1.1, 1.1 );
			elseif iCombo > 9 then
				NumberX = -16
				c.Label:x(-11);
				params.Zoom = scale( iCombo, 0, 1, 1.05, 1.05 );
				params.Zoom = clamp( params.Zoom, 1.05, 1.05 );
			else
				NumberX = -32
				c.Label:x(-27);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			end;
			if lsatWorstJudge[p]==1 then
				c.NumberW1:visible(true);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(3);
			elseif lsatWorstJudge[p]==2 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(true);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(2);
			elseif lsatWorstJudge[p]==3 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(true);
				c.NumberW4:visible(false);
				c.Label:setstate(1);
			elseif lsatWorstJudge[p]==4 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(true);
				c.Label:setstate(0);
			end;
		elseif bComboGraphic == 'x2' then
			if iCombo > 9999 then
				NumberX = 33
				c.Label:x(43);
				params.Zoom = scale( iCombo, 0, 100, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			elseif iCombo > 999 then
				NumberX = 26
				c.Label:x(36);
				params.Zoom = scale( iCombo, 0, 100, 1.12, 1.12 );
				params.Zoom = clamp( params.Zoom, 1.12, 1.12 );
			elseif iCombo > 99 then
				NumberX = 30
				c.Label:x(40);
				params.Zoom = scale( iCombo, 0, 1, 1.35, 1.35 );
				params.Zoom = clamp( params.Zoom, 1.35, 1.35 );
			elseif iCombo > 89 then
				NumberX = 4
				c.Label:x(14);
				params.Zoom = scale( iCombo, 0, 1, 1.31, 1.31 );
				params.Zoom = clamp( params.Zoom, 1.31, 1.31 );
			elseif iCombo > 79 then
				NumberX = 2
				c.Label:x(12);
				params.Zoom = scale( iCombo, 0, 1, 1.27, 1.27 );
				params.Zoom = clamp( params.Zoom, 1.27, 1.27 );
			elseif iCombo > 69 then
				NumberX = 0
				c.Label:x(10);
				params.Zoom = scale( iCombo, 0, 1, 1.23, 1.23 );
				params.Zoom = clamp( params.Zoom, 1.23, 1.23 );
			elseif iCombo > 59 then
				NumberX = -2
				c.Label:x(8);
				params.Zoom = scale( iCombo, 0, 1, 1.19, 1.19 );
				params.Zoom = clamp( params.Zoom, 1.19, 1.19 );
			elseif iCombo > 49 then
				NumberX = -4
				c.Label:x(6);
				params.Zoom = scale( iCombo, 0, 1, 1.15, 1.15 );
				params.Zoom = clamp( params.Zoom, 1.15, 1.15 );
			elseif iCombo > 39 then
				NumberX = -6
				c.Label:x(4);
				params.Zoom = scale( iCombo, 0, 1, 1.11, 1.11 );
				params.Zoom = clamp( params.Zoom, 1.11, 1.11 );
			elseif iCombo > 29 then
				NumberX = -8
				c.Label:x(2);
				params.Zoom = scale( iCombo, 0, 1, 1.07, 1.07 );
				params.Zoom = clamp( params.Zoom, 1.07, 1.07 );
			elseif iCombo > 19 then
				NumberX = -10
				c.Label:x(0);
				params.Zoom = scale( iCombo, 0, 1, 1.03, 1.03 );
				params.Zoom = clamp( params.Zoom, 1.03, 1.03 );
			elseif iCombo > 9 then
				NumberX = -12
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 0.99, 0.99 );
				params.Zoom = clamp( params.Zoom, 0.99, 0.99 );
			else
				NumberX = -20
				c.Label:x(-10);
				params.Zoom = scale( iCombo, 0, 1, 0.95, 0.95 );
				params.Zoom = clamp( params.Zoom, 0.95, 0.95 );
			end;
			if lsatWorstJudge[p]==1 then
				c.NumberW1:visible(true);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(3);
			elseif lsatWorstJudge[p]==2 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(true);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(2);
			elseif lsatWorstJudge[p]==3 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(true);
				c.NumberW4:visible(false);
				c.Label:setstate(1);
			elseif lsatWorstJudge[p]==4 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(true);
				c.Label:setstate(0);
			end;
			params.LabelZoom = scale( iCombo, 0, 4, 0.95, 0.95 );
			params.LabelZoom = clamp( params.LabelZoom, 0.95, 0.95 );
		elseif bComboGraphic == 'x3' then
			c.Label:y(3);
			if iCombo > 9999 then
				NumberX = 42
				c.Label:x(51);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			elseif iCombo > 999 then
				NumberX = 34
				c.Label:x(43);
				params.Zoom = scale( iCombo, 0, 1, 1.14, 1.14 );
				params.Zoom = clamp( params.Zoom, 1.14, 1.14 );
			elseif iCombo > 99 then
				NumberX = 26
				c.Label:x(40);
				params.Zoom = scale( iCombo, 0, 1, 1.35, 1.35 );
				params.Zoom = clamp( params.Zoom, 1.35, 1.35 );
			elseif iCombo > 89 then
				NumberX = 5
				c.Label:x(14);
				params.Zoom = scale( iCombo, 0, 1, 1.31, 1.31 );
				params.Zoom = clamp( params.Zoom, 1.31, 1.31 );
			elseif iCombo > 79 then
				NumberX = 3
				c.Label:x(12);
				params.Zoom = scale( iCombo, 0, 1, 1.26, 1.26 );
				params.Zoom = clamp( params.Zoom, 1.26, 1.26 );
			elseif iCombo > 69 then
				NumberX = 1
				c.Label:x(10);
				params.Zoom = scale( iCombo, 0, 1, 1.22, 1.22 );
				params.Zoom = clamp( params.Zoom, 1.22, 1.22 );
			elseif iCombo > 59 then
				NumberX = -1
				c.Label:x(8);
				params.Zoom = scale( iCombo, 0, 1, 1.17, 1.17 );
				params.Zoom = clamp( params.Zoom, 1.17, 1.17 );
			elseif iCombo > 49 then
				NumberX = -3
				c.Label:x(6);
				params.Zoom = scale( iCombo, 0, 1, 1.13, 1.13 );
				params.Zoom = clamp( params.Zoom, 1.13, 1.13 );
			elseif iCombo > 39 then
				NumberX = -5
				c.Label:x(4);
				params.Zoom = scale( iCombo, 0, 1, 1.08, 1.08 );
				params.Zoom = clamp( params.Zoom, 1.08, 1.08 );
			elseif iCombo > 29 then
				NumberX = -7
				c.Label:x(2);
				params.Zoom = scale( iCombo, 0, 1, 1.04, 1.04 );
				params.Zoom = clamp( params.Zoom, 1.04, 1.04 );
			elseif iCombo > 19 then
				NumberX = -9
				c.Label:x(0);
				params.Zoom = scale( iCombo, 0, 1, 0.99, 0.99 );
				params.Zoom = clamp( params.Zoom, 0.99, 0.99 );
			elseif iCombo > 9 then
				NumberX = -11
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 0.95, 0.95 );
				params.Zoom = clamp( params.Zoom, 0.95, 0.95 );
			else
				NumberX = -18
				c.Label:x(-9);
				params.Zoom = scale( iCombo, 0, 1, 0.9, 0.9 );
				params.Zoom = clamp( params.Zoom, 0.9, 0.9 );
			end;
			if lsatWorstJudge[p]==1 then
				c.NumberW1:visible(true);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(3);
			elseif lsatWorstJudge[p]==2 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(true);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(2);
			elseif lsatWorstJudge[p]==3 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(true);
				c.NumberW4:visible(false);
				c.Label:setstate(1);
			elseif lsatWorstJudge[p]==4 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(true);
				c.Label:setstate(0);
			end;
		elseif bComboGraphic == '2013' then
			c.Label:y(3);
			if iCombo > 9999 then
				NumberX = 41
				c.Label:x(45);
				params.Zoom = scale( iCombo, 0, 1, 0.79, 0.79 );
				params.Zoom = clamp( params.Zoom, 0.79, 0.79 );
			elseif iCombo > 999 then
				NumberX = 33
				c.Label:x(37);
				params.Zoom = scale( iCombo, 0, 1, 0.9, 0.9 );
				params.Zoom = clamp( params.Zoom, 0.9, 0.9 );
			elseif iCombo > 99 then
				NumberX = 22
				c.Label:x(26);
				params.Zoom = scale( iCombo, 0, 1, 1.03, 1.03 );
				params.Zoom = clamp( params.Zoom, 1.03, 1.03 );
			elseif iCombo > 89 then
				NumberX = 4
				c.Label:x(8);
				params.Zoom = scale( iCombo, 0, 1, 1, 1 );
				params.Zoom = clamp( params.Zoom, 1, 1 );
			elseif iCombo > 79 then
				NumberX = 2
				c.Label:x(6);
				params.Zoom = scale( iCombo, 0, 1, 0.97, 0.97 );
				params.Zoom = clamp( params.Zoom, 0.97, 0.97 );
			elseif iCombo > 69 then
				NumberX = 0
				c.Label:x(4);
				params.Zoom = scale( iCombo, 0, 1, 0.94, 0.94 );
				params.Zoom = clamp( params.Zoom, 0.94, 0.94 );
			elseif iCombo > 59 then
				NumberX = -2
				c.Label:x(2);
				params.Zoom = scale( iCombo, 0, 1, 0.91, 0.91 );
				params.Zoom = clamp( params.Zoom, 0.91, 0.91 );
			elseif iCombo > 49 then
				NumberX = -4
				c.Label:x(0);
				params.Zoom = scale( iCombo, 0, 1, 0.88, 0.88 );
				params.Zoom = clamp( params.Zoom, 0.88, 0.88 );
			elseif iCombo > 39 then
				NumberX = -6
				c.Label:x(-2);
				params.Zoom = scale( iCombo, 0, 1, 0.85, 0.85 );
				params.Zoom = clamp( params.Zoom, 0.85, 0.85 );
			elseif iCombo > 29 then
				NumberX = -8
				c.Label:x(-4);
				params.Zoom = scale( iCombo, 0, 1, 0.82, 0.82 );
				params.Zoom = clamp( params.Zoom, 0.82, 0.82 );
			elseif iCombo > 19 then
				NumberX = -10
				c.Label:x(-6);
				params.Zoom = scale( iCombo, 0, 1, 0.79, 0.79 );
				params.Zoom = clamp( params.Zoom, 0.79, 0.79 );
			elseif iCombo > 9 then
				NumberX = -12
				c.Label:x(-8);
				params.Zoom = scale( iCombo, 0, 1, 0.76, 0.76 );
				params.Zoom = clamp( params.Zoom, 0.76, 0.76 );
			else
				NumberX = -19
				c.Label:x(-15);
				params.Zoom = scale( iCombo, 0, 1, 0.73, 0.73 );
				params.Zoom = clamp( params.Zoom, 0.73, 0.73 );
			end;
			if lsatWorstJudge[p]==1 then
				c.NumberW1:visible(true);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(3);
			elseif lsatWorstJudge[p]==2 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(true);
				c.NumberW3:visible(false);
				c.NumberW4:visible(false);
				c.Label:setstate(2);
			elseif lsatWorstJudge[p]==3 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(true);
				c.NumberW4:visible(false);
				c.Label:setstate(1);
			elseif lsatWorstJudge[p]==4 then
				c.NumberW1:visible(false);
				c.NumberW2:visible(false);
				c.NumberW3:visible(false);
				c.NumberW4:visible(true);
				c.Label:setstate(0);
			end;
		end;
		c.NumberW1:x(NumberX);
		c.NumberW2:x(NumberX);
		c.NumberW3:x(NumberX);
		c.NumberW4:x(NumberX);
		PulsePlayer( c.NumberW1, params );
		PulsePlayer( c.NumberW2, params );
		PulsePlayer( c.NumberW3, params );
		PulsePlayer( c.NumberW4, params );
		PulseLabelPlayer( c.Label, params );
	end;
};

-- Tokimeki Voice
if not noplayer and tokimeki then
	t[#t+1]=Def.ActorFrame {
		LoadActor(THEME:GetPathS("", "_"..bScreenFilter.."_LetsGo")) .. {
			Name="Sound_LetsGo";
		};
		LoadActor(THEME:GetPathS("", "_"..bScreenFilter.."_Perfect" )) .. {
			Name="Sound_Perfect";
		};
		LoadActor(THEME:GetPathS("", "_"..bScreenFilter.."_Great")) .. {
			Name="Sound_Great";
		};
		LoadActor(THEME:GetPathS("", "_"..bScreenFilter.."_Good")) .. {
			Name="Sound_Good";
		};
		LoadActor(THEME:GetPathS("", "_"..bScreenFilter.."_Miss01")) .. {
			Name="Sound_Miss01";
		};
		LoadActor(THEME:GetPathS("", "_"..bScreenFilter.."_Miss02")) .. {
			Name="Sound_Miss02";
		};
		LoadActor(THEME:GetPathS( "", "_Tokimeki_Clap")) .. {
			Name="Sound_Clap";
		};
		InitCommand = function(self)
			c2 = self:GetChildren();
			c2.Sound_LetsGo:play();
		end;
		ComboCommand=function(self,params)
			local iCombo = params.Combo;
			local bCombo = params.Misses;
			if (iCombo % 25) == 0 or iCombo == 10 then
				local Ramdoms = {1,2,3,4}
				local RamdomVoice = Ramdoms[math.random(#Ramdoms)];
				if RamdomVoice == 1 then
					c2.Sound_Perfect:play();
				elseif RamdomVoice == 2 then
					c2.Sound_Great:play();
				elseif RamdomVoice == 3 then
					c2.Sound_Good:play();
				elseif RamdomVoice == 4 then
					c2.Sound_Clap:play();
				end;
			elseif bCombo == 1 or bCombo == 20 or bCombo == 40 then
				local RamdomMissVoice = math.random(1,2);
				if RamdomMissVoice == 1 then
					c2.Sound_Miss01:play();
				elseif RamdomMissVoice == 2 then
					c2.Sound_Miss02:play();
				end;
			end;
		end;
	};
end;
--[[
-- CutIn Save            CONFIG COMBO CUTIN
setenv("CutInA_P1",false);
setenv("CutInA_P2",false);
setenv("CutInB_P1",false);
setenv("CutInB_P2",false);

if cutin(player) then
	t[#t+1] = Def.Actor {
		ComboCommand = function(self,params)
			if params.Combo == 10 then
--			if (params.Combo % 100) == 0 then
				setenv("CutInB_"..ToEnumShortString(player),true);
--			elseif params.Combo == 20 or (params.Combo % 50) == 0 then
			elseif params.Combo == 20 then
				setenv("CutInA_"..ToEnumShortString(player),true);
			elseif params.Combo == 40 then
				setenv("CutInB_"..ToEnumShortString(player),true);
			elseif params.Combo == 50 then
				setenv("CutInA_"..ToEnumShortString(player),true);	
			else
				setenv("CutInA_"..ToEnumShortString(player),false);
				setenv("CutInB_"..ToEnumShortString(player),false);
			end;
		end;
	};
end;

if cutin(player) then
	t[#t+1] = Def.Actor {
		ComboCommand = function(self,params)
			if params.Combo == 10 then
--			if (params.Combo % 100) == 0 then
				setenv("CutInB_"..ToEnumShortString(player),true);
--			elseif params.Combo == 20 or (params.Combo % 50) == 0 then
			elseif params.Combo == 20 then
				setenv("CutInA_"..ToEnumShortString(player),true);
			elseif params.Combo == 40 then
				setenv("CutInB_"..ToEnumShortString(player),true);
			elseif params.Combo == 50 then
				setenv("CutInA_"..ToEnumShortString(player),true);	
			else
				setenv("CutInA_"..ToEnumShortString(player),false);
				setenv("CutInB_"..ToEnumShortString(player),false);
			end;
		end;
	};
end;
--]]
------------------- combo POPUP ------------- strider -------
setenv("PopupA_P1",false);
setenv("PopupA_P2",false);
setenv("PopupB_P1",false);
setenv("PopupB_P2",false);
setenv("PopupC_P1",false);
setenv("PopupC_P2",false);
if Popup(player) then
	t[#t+1] = Def.Actor {
		ComboCommand = function(self,params)
			if params.Combo == 25 then
--			if (params.Combo % 100) == 0 then
				setenv("PopupB_"..ToEnumShortString(player),true);
--			elseif params.Combo == 20 or (params.Combo % 50) == 0 then
			elseif params.Combo == 50 then
				setenv("PopupA_"..ToEnumShortString(player),true);
			elseif params.Combo == 100 then
				setenv("PopupC_"..ToEnumShortString(player),true);
			elseif params.Combo == 150 then
				setenv("PopupA_"..ToEnumShortString(player),true); 
			elseif (params.Combo % 100) == 0 then
				setenv("PopupA_"..ToEnumShortString(player),true);
            elseif (params.Combo % 25) == 0 then
				setenv("PopupB_"..ToEnumShortString(player),true);
			elseif (params.Combo % 50) == 0 then
				setenv("PopupC_"..ToEnumShortString(player),true);					
			else
				setenv("PopupA_"..ToEnumShortString(player),false);
				setenv("PopupB_"..ToEnumShortString(player),false);
				setenv("PopupC_"..ToEnumShortString(player),false);
			end;
		end;
	};
end; 
----------------------------
return t;