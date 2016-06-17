setenv("GroupNameChange",nil);
return Def.ActorFrame {
	-- BG
	LoadActor(THEME:GetPathB("ScreenWithMenuElements", "background"));
	-- Black Shadow
	Def.Quad{
		InitCommand=cmd(diffuse,color("0,0,0,0.4");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
	};
	-- Header
	LoadActor( THEME:GetPathG("ScreenOptions","header/ScreenOptions header") ) .. {
		InitCommand=cmd(vertalign,top;x,WideScale(SCREEN_CENTER_X+83,SCREEN_CENTER_X);y,SCREEN_TOP);
	};
	-- Subtext
	LoadFont( "Common Normal" ) .. {
		Text=THEME:GetString("ScreenReloadSongs","Reload");
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X+133,SCREEN_CENTER_X+50);y,SCREEN_TOP+35;horizalign,left;diffuse,color("#fff90a");strokecolor,color("#000000");zoomx,0.8;zoomy,0.68;);
	};
	-- Page	
	LoadActor( THEME:GetPathG("ScreenOptions","page") ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	};
	-- Explanation
	LoadFont("Common Normal") .. {
		Text=THEME:GetString("ScreenReloadSongs","ExplanationReload");
		InitCommand=cmd(x,SCREEN_CENTER_X-285;y,SCREEN_CENTER_Y+88;zoomx,0.6;zoomy,0.6;wrapwidthpixels,850;horizalign,left;vertalign,top;);
	};
};