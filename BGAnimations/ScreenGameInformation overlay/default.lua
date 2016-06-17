local pm = GAMESTATE:GetPlayMode();

local Background = {
	PlayMode_Regular = "_regular";
	PlayMode_Nonstop = "_nonstop";
	PlayMode_Oni = "_oni";
	PlayMode_Endless = "_endless";
	PlayMode_Rave = "_rave";
};

local t = Def.ActorFrame {
	LoadActor( Background[pm] );
	Title;
	Instructions; -- Keep this at index 3 or change below.
	InitCommand = cmd(x,SCREEN_LEFT-SCREEN_WIDTH;y,SCREEN_CENTER_Y);
	OnCommand = cmd(sleep,0;decelerate,0.6;x,SCREEN_CENTER_X);
	OffCommand = cmd(stoptweening;accelerate,0.3;x,SCREEN_RIGHT+SCREEN_WIDTH);
};



return t;
