-- from popcandy

local function radarSet(self,player)
	local selection = nil;
	if GAMESTATE:IsCourseMode() then
		if GAMESTATE:GetCurrentCourse() then
			selection = GAMESTATE:GetCurrentTrail(player);
		end;
	else
		if GAMESTATE:GetCurrentSong() then
			selection = GAMESTATE:GetCurrentSteps(player);
		end;
	end;
	if selection then
		self:SetFromRadarValues(player, selection:GetRadarValues(player));
	else
		self:SetEmpty(player);
	end;
end

local t = Def.ActorFrame {
	Name="Radar";

	Def.GrooveRadar {
	--	OffCommand=cmd(linear,0.25;zoom,0);
		CurrentSongChangedMessageCommand=function(self)
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				radarSet(self, pn);
			end;
		end;
		CurrentStepsP1ChangedMessageCommand=function(self) radarSet(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) radarSet(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) radarSet(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) radarSet(self, PLAYER_2); end;
	};
};

return t;