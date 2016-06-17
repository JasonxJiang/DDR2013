-- Screen Filter
-- Based on moonlight by AJ 187
-- and default_plus_5 by Dreamwoods, Default Extended by A.C

local t = Def.ActorFrame {}
local Player = ...;
assert(...);

local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local IsUsingCenter1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local pname = ToEnumShortString(Player);

-- Filter x position load from metrics.ini
local function FilterPosition()
	if IsUsingCenter1Player and NumPlayers == 1 and NumSides == 1 then return SCREEN_CENTER_X; end;
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
	return THEME:GetMetric("ScreenGameplay","Player".. pname .. strPlayer .. strSide .."X");
end;

local bScreenFilter = ScreenFilter(Player);

local function Update(self)
	local song = GAMESTATE:GetCurrentSong();
	local start = song:GetFirstBeat();
	local last = song:GetLastBeat();
	if (GAMESTATE:GetSongBeat() >= last) then
		self:visible(false);
	elseif (GAMESTATE:GetSongBeat() >= start-8) then
		self:visible(true);
	else
		self:visible(false);
	end;
end;

local tokimeki;
if bScreenFilter == "TOKIMEKI MIYUKI" or bScreenFilter == "TOKIMEKI KAORI" or bScreenFilter == "TOKIMEKI MIHO" or bScreenFilter == "TOKIMEKI MAHO" then
	tokimeki = true;
else
	tokimeki = false;
end;

t[#t+1]=Def.ActorFrame{
	InitCommand=function(self)
		if bScreenFilter == "DARK" 
		or bScreenFilter == "DARKER" 
		or bScreenFilter == "DARKEST" then
			self:SetUpdateFunction(Update);
		end;
	end;
	Def.Sprite {
		InitCommand=function(self)
			self:x(FilterPosition());
			self:y(SCREEN_CENTER_Y);
			if bScreenFilter == "DARK" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Single"));
				end;
				self:zoomx(1.3);
				self:zoomy(2);
				self:zoomx(1.3);
				self:diffusealpha(0.25);
			elseif bScreenFilter == "DARKER" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Single"));
				end;
				self:zoomx(1.3);
				self:zoomy(2);
				self:diffusealpha(0.5);
			elseif bScreenFilter == "DARKEST" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Normal_Single"));
				end;
				self:zoomx(1.3);
				self:zoomy(2);
				self:diffusealpha(0.75);
			elseif bScreenFilter == "BLUE LANE" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneBlue_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneBlue_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneBlue_Single"));
				end;
				self:diffusealpha(0);
				self:sleep(1.5);
				self:linear(0.5);
				self:diffusealpha(1);
			elseif bScreenFilter == "RED LANE" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneRed_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneRed_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneRed_Single"));
				end;
				self:diffusealpha(0);
				self:sleep(1.5);
				self:linear(0.5);
				self:diffusealpha(1);
			elseif bScreenFilter == "GREEN LANE" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneGreen_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneGreen_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneGreen_Single"));
				end;
				self:diffusealpha(0);
				self:sleep(1.5);
				self:linear(0.5);
				self:diffusealpha(1);
			elseif bScreenFilter == "YELLOW LANE" then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneYellow_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneYellow_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneYellow_Single"));
				end;
				self:diffusealpha(0);
				self:sleep(1.5);
				self:linear(0.5);
				self:diffusealpha(1);
			elseif bScreenFilter == "DARK LANE" then
				if st=='StepsType_Dance_Double' then
					if Player == PLAYER_1 then
						self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneDark_Double_1P"));
					else
						self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneDark_Double_2P"));
					end;
				elseif st=='StepsType_Dance_Solo' then
					if Player == PLAYER_1 then
						self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneDark_Solo_1P"));
					else
						self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneDark_Solo_2P"));
					end;
				else
					if Player == PLAYER_1 then
						self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneDark_Single_1P"));
					else
						self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_LaneDark_Single_2P"));
					end;
				end;
				self:y(SCREEN_BOTTOM);
				self:vertalign(bottom);
				self:diffusealpha(0);
				self:zoom(4.5);
				self:sleep(1.5);
				self:linear(1.5);
				self:zoom(1.333);
				self:diffusealpha(0.5);
			elseif tokimeki then
				if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Tokimeki_Double"));
				elseif st=='StepsType_Dance_Solo' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Tokimeki_Solo"));
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/ScreenFilter_Tokimeki_Single"));
				end;
				self:diffusealpha(0.5);
			end;
		end;
	};
	Def.Sprite {
		InitCommand=function(self)
			if tokimeki then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W3"));
			else
				return;
			end;
			self:diffusealpha(0);
			self:sleep(1);
			if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
				self:y(SCREEN_CENTER_Y-185);
			else
				self:y(SCREEN_CENTER_Y+176);
			end;			
			if st=='StepsType_Dance_Double' then
				if Player == PLAYER_1 then
					self:x(FilterPosition()-338);
					self:linear(1.25);
					self:diffusealpha(1);
					self:x(FilterPosition()-264);
					if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
						self:addy(74);
					else
						self:addy(-74);
					end;
					self:linear(0.4);
					self:x(FilterPosition()-236);
				else
					self:x(FilterPosition()+338);
					self:linear(1.25);
					self:diffusealpha(1);
					self:x(FilterPosition()+264);
					if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
						self:addy(74);
					else
						self:addy(-74);
					end;
					self:linear(0.4);
					self:x(FilterPosition()+236);
				end;
			elseif st=='StepsType_Dance_Solo' then
				if Player == PLAYER_1 then
					self:x(FilterPosition()-274);
					self:linear(1.25);
					self:diffusealpha(1);
					self:x(FilterPosition()-200);
					if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
						self:addy(74);
					else
						self:addy(-74);
					end;
					self:linear(0.4);
					self:x(FilterPosition()-172);
				else
					self:x(FilterPosition()+274);
					self:linear(1.25);
					self:diffusealpha(1);
					self:x(FilterPosition()+200);
					if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
						self:addy(74);
					else
						self:addy(-74);
					end;
					self:linear(0.4);
					self:x(FilterPosition()+172);
				end;
			else
				if Player == PLAYER_1 then
					self:x(FilterPosition()-210);
					self:linear(1.25);
					self:diffusealpha(1);
					self:x(FilterPosition()-136);
					if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
						self:addy(74);
					else
						self:addy(-74);
						
					end;
					self:linear(0.4);
					self:x(FilterPosition()-108);
				else
					self:x(FilterPosition()+210);
					self:linear(1.25);
					self:diffusealpha(1);
					self:x(FilterPosition()+136);
					if GAMESTATE:PlayerIsUsingModifier(Player,'reverse') then
						self:addy(74);
					else
						self:addy(-74);
					end;
					self:linear(0.4);
					self:x(FilterPosition()+108);
				end;
			end;
		end;
		JudgmentMessageCommand = function(self, params)
			if not tokimeki then return end
			if params.Player ~= Player then return end
			if params.TapNoteScore == 'TapNoteScore_W1' then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W1"));
			elseif params.TapNoteScore == 'TapNoteScore_W2' then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W2"));
			elseif params.TapNoteScore == 'TapNoteScore_W3' then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W3"));
			elseif params.TapNoteScore == 'TapNoteScore_W4' then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W4"));
			elseif params.TapNoteScore == 'TapNoteScore_W5' or params.TapNoteScore == 'TapNoteScore_Miss' or params.TapNoteScore == 'TapNoteScore_HitMine' then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W5"));
			elseif params.HoldNoteScore == 'HoldNoteScore_LetGo' then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/"..bScreenFilter.."_W5"));
			end
		end;
	};
};

return t