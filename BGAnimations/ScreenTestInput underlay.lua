return Def.ActorFrame {
	--Def.ControllerStateDisplay {
	--	InitCommand=cmd(LoadGameController,
	--};
	Def.DeviceList {
		Font="Common normal";
		InitCommand=cmd(x,SCREEN_LEFT+20;y,SCREEN_TOP+100;zoom,0.8;halign,0;strokecolor,color("#000000"));
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
	Def.InputList {
		Font="Common normal";
		InitCommand=cmd(x,SCREEN_CENTER_X-250;y,SCREEN_CENTER_Y;zoom,0.6;halign,0;vertspacing,8;strokecolor,color("#000000"));
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
	LoadActor( THEME:GetPathG("ScreenOptions","page") ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomx,1;linear,0.25;zoomx,0);
		OffCommand=cmd(sleep,0.25;zoomx,0;linear,0.25;zoomx,1);
	};
};
