local t = Def.ActorFrame {
    LoadActor("bg") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(playcommand,"Animate");
	AnimateCommand=cmd(rotationz,0;linear,60;rotationz,360;queuecommand,"Animate");
    };
    LoadActor( "Effectbg_ddr2013.png" )..{
    InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0.5);
	OnCommand=cmd(spin;effectmagnitude,0,0,10);
	};
	LoadActor( "Effectbg_ddr2013.png" )..{
		InitCommand=cmd(blend,'BlendMode_Add';zoom,0.9;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1);
		--SPIN;effectmagnitude,x,y,z
		OnCommand=cmd(spin;effectmagnitude,0,0,15);
	};
	LoadActor( "Effectbg_ddr2013.png" )..{
		InitCommand=cmd(rotationz,90;zoom,1.3;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0.5);
		OnCommand=cmd(spin;effectmagnitude,0,0,-5);
	};	
	LoadActor("mw") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y),
		OnCommand=cmd(spin;effectmagnitude,0,40,0),
	};
	LoadActor("band.png") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y),
	};
	LoadActor("ScreenRanking header") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP;vertalign,top;),
	};
	
	LoadFont("_impact2 60px") .. {
		Text="BEST RANKING";
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-149.5),
		OnCommand=cmd(zoom,0;bounceend,0.25;zoomx,1;zoomy,1;sleep,15.5;bouncebegin,0.25;zoom,0;),
	};

}

return t
