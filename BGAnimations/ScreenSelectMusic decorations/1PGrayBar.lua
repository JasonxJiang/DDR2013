return Def.ActorFrame {
-- Bar Back 1
    LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+163;zoomx,0;sleep,0.1;linear,0.1;zoomx,1);
		OffCommand=cmd(sleep,0.5;linear,0.1;zoomx,0);
	};
-- Bar Back 2
	LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+189;zoomx,0;sleep,0.2;linear,0.1;zoomx,1);
		OffCommand=cmd(sleep,0.4;linear,0.1;zoomx,0);
	};
-- Bar Back 3
	LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+215;zoomx,0;sleep,0.3;linear,0.1;zoomx,1);
		OffCommand=cmd(sleep,0.3;linear,0.1;zoomx,0);
	};
-- Bar Back 4
	LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+241;zoomx,0;sleep,0.4;linear,0.1;zoomx,1);
		OffCommand=cmd(sleep,0.2;linear,0.1;zoomx,0);
	};	
-- Bar Back 5
	LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+267;zoomx,0;sleep,0.5;linear,0.1;zoomx,1);
		OffCommand=cmd(sleep,0.1;linear,0.1;zoomx,0);
	};	
};
--[[
------------------------------------------------------ second test ------------
local t = Def.ActorFrame{};
-- Bar Back 1
t[#t+1] = LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+163;zoomx,0;sleep,0.1;linear,0.1;zoomx,1);
		OffCommand=cmd(sleep,0.5;linear,0.1;zoomx,0);
	};
-- Bar Back 2
t[#t+1] = LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+189);
		OffCommand=cmd(sleep,0.4;linear,0.1;zoomx,0);
	};
-- Bar Back 3
t[#t+1] = LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+215);
		OffCommand=cmd(sleep,0.3;linear,0.1;zoomx,0);
	};
-- Bar Back 4
t[#t+1] = LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+241);
		OffCommand=cmd(sleep,0.2;linear,0.1;zoomx,0);
	};	
-- Bar Back 5
t[#t+1] = LoadActor("GrayBar") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X-431;y,SCREEN_CENTER_Y+267);
		OffCommand=cmd(sleep,0.1;linear,0.1;zoomx,0);
	};	
return t; ]]--