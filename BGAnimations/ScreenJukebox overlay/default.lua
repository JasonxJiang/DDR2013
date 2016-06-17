local t = Def.ActorFrame {
	LoadActor("../ScreenDemonstration overlay/demonstration_header") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP;vertalign,top);
	};
	LoadActor("ScreenJukebox_title") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-SCREEN_WIDTH/3.4;y,SCREEN_TOP;vertalign,top);
	};
};

return t;