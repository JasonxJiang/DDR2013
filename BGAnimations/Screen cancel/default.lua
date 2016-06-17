return Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(diffuse,color("0,0,0,0.5");Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1;sleep,0.7);
	};
	LoadActor(THEME:GetPathS("Common","cancel")) .. {
		StartTransitioningCommand=cmd(play);
	};
	--[[
	Def.ActorFrame {
		InitCommand = function(self)
			if GAMESTATE:IsSideJoined(PLAYER_1) then
				local rpf = ReadPrefFromFile("FirstReMIX_SpeedSaveP1")
				local ps = GAMESTATE:GetPlayerState(PLAYER_1);
				local modstring = ps:GetPlayerOptionsString("ModsLevel_Preferred");
				modstring = "default, " .. modstring;
				modstring = modstring .. ", " .. rpf .. "x";
				ps:SetPlayerOptions("ModsLevel_Preferred", modstring);
			end;
			if GAMESTATE:IsSideJoined(PLAYER_2) then
				local rpf = ReadPrefFromFile("FirstReMIX_SpeedSaveP2")
				local ps = GAMESTATE:GetPlayerState(PLAYER_2);
				local modstring = ps:GetPlayerOptionsString("ModsLevel_Preferred");
				modstring = "default, " .. modstring;
				modstring = modstring .. ", " .. rpf .. "x";
				ps:SetPlayerOptions("ModsLevel_Preferred", modstring);
			end;
		end;
	};
	--]]
};