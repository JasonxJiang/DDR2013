local t = Def.ActorFrame {

	Def.Quad{
		InitCommand=cmd(diffuse,color("0,0,0,1");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
	};

	LoadActor("Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT);
	--	OnCommand = cmd(diffusealpha,0;sleep,161.8;linear,1;diffusealpha,1;sleep,99.5;linear,1;diffusealpha,0),
		OnCommand = cmd(diffusealpha,0;sleep,161.8;linear,1;diffusealpha,1;sleep,99.5;linear,3.2*2;diffusealpha,0),
	};
	
	LoadActor("Mask") .. {
		InitCommand=cmd(MaskSource;x,WideScale(SCREEN_CENTER_X,SCREEN_CENTER_X+59);y,SCREEN_CENTER_Y);
	};
	
	LoadActor("ddr") .. {
		InitCommand=cmd(MaskDest,zoom,1;x,WideScale(SCREEN_CENTER_X+145,SCREEN_CENTER_X+204);y,SCREEN_CENTER_Y-40);
	};
	
	--[[
	LoadActor("Overlay1") .. {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X,SCREEN_CENTER_X+59);y,SCREEN_CENTER_Y;);
	};
	LoadActor("Overlay12") .. {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X,SCREEN_CENTER_X+59);y,SCREEN_CENTER_Y;);
		OnCommand = cmd(diffusealpha,0;sleep,161.8;linear,1;diffusealpha,1;sleep,99.5;linear,1;diffusealpha,0),
	};
--]]

	LoadActor( "credits_a" ) .. {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X-304,SCREEN_CENTER_X-364);y,SCREEN_CENTER_Y;);
		OnCommand=cmd(zoom,1;sleep,161.8;linear,0;zoom,0);
	};

	LoadActor( "credits_b" ) .. {
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X-304,SCREEN_CENTER_X-364);y,SCREEN_CENTER_Y;);
		OnCommand=cmd(zoom,0;sleep,161.8;linear,0;zoom,1);
	};

	LoadActor( "toshiba_logo" ) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-(SCREEN_WIDTH/3.6)-127;y,SCREEN_TOP-100;);
		OnCommand=cmd(addy,SCREEN_HEIGHT*2;sleep,224.1;linear,28.75;addy,-SCREEN_HEIGHT*2),
	--	OnCommand=cmd(addy,SCREEN_HEIGHT*2;sleep,222.10;linear,29.75;addy,-SCREEN_HEIGHT*2),
	};

	LoadActor( "konami_logo" ) .. {
		InitCommand=cmd(zoom,WideScale(0.8,1);x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(addy,SCREEN_HEIGHT;sleep,258.76+3.2+0.6;linear,15.25;addy,-SCREEN_HEIGHT),
	};

	LoadFont("_serpentinedbol 19px") .. {
		Text="© 1998-".. Year() .." KONAMI ALL RIGHTS RESERVED.";
		InitCommand=cmd(x,SCREEN_CENTER_X+5;y,SCREEN_BOTTOM-34);
		OnCommand=cmd(zoom,1.15;addy,SCREEN_HEIGHT;sleep,258.76+3.2+0.6;linear,15.25;addy,-SCREEN_HEIGHT);
	};

};

return t;