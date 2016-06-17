return Def.ActorFrame {
	InitCommand=cmd();
	-- Back
	LoadActor(THEME:GetPathB("ScreenSelectMusic","background/bg_normal")) .. {
		InitCommand=cmd(zoomtowidth,640;zoomtoheight,480;texcoordvelocity,0.05,0;customtexturerect,0,0,1,1);
		OnCommand=cmd();
	};
	-- Banners
	LoadActor("ScreenSelectMusic_Banner") .. {
		InitCommand=cmd(y,-83);
		OnCommand=cmd(sleep,160.5;bouncebegin,0.15;zoomy,0);
	};
	-- Difficulty
	LoadActor("ScreenSelectMusic_Difficulty") .. {
		InitCommand=cmd(y,114);
		OnCommand=cmd(sleep,160.5;linear,0.25;diffusealpha,0);
	};
	
	-- Header
	LoadActor(THEME:GetPathG("ScreenSelectMusic","header")) .. {
		InitCommand=cmd(y,-234;vertalign,top);
		OnCommand=cmd(sleep,160.5;linear,0.25;addy,-74);
	};
	-- MenuTimer frame
	LoadActor(THEME:GetPathG("MenuTimer","frame")) .. {
		InitCommand=cmd(x,225;y,-216);
		OnCommand=cmd(sleep,160.5;linear,0.25;addy,-74);
	};
	-- MenuTimer
	LoadFont("MenuTimer numbers")..{
		InitCommand=cmd(x,248;y,-222;zoomx,0.75;zoomy,0.85;settext,"99";shadowlength,1;);
		OnCommand=cmd(sleep,160.5;linear,0.25;addy,-74);
	};
	--[[
	-- CDtitle
	LoadActor("Extreme") .. {
		InitCommand=cmd(x,135;y,-162);
		OnCommand=cmd(bouncebegin,0.15;zoomx,0);
	};
	-- Song stage
	Def.ActorFrame{
		InitCommand=cmd(x,247;y,-185);
		-- Under blue text
		LoadFont("_banque Gothique RR Bold")..{
			InitCommand=cmd(diffuse,color("#ffffff");strokecolor,color("#080850");zoom,0.75;uppercase,true;maxwidth,190;settext,"EXTRA STAGE");
			OnCommand=cmd(linear,0.25;addy,-74);
		};
		-- Over red text
		LoadFont("_banque Gothique RR Bold")..{
			InitCommand=cmd(diffuse,color("#e02820");strokecolor,color("#ffffff");zoom,0.75;uppercase,true;maxwidth,190;settext,"EXTRA ####=");
			OnCommand=cmd(linear,0.25;addy,-74);
		};
	};
	--]]
	-- Move Left
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/Move_Left")) .. {
		InitCommand=cmd(x,-127;y,-15;diffuse,color("#f70000"));
		OnCommand=cmd(sleep,160.5;diffusealpha,0);
	};
	-- Move Right
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/Move_Left")) .. {
		InitCommand=cmd(x,127;y,-15;diffuse,color("#f70000");zoomx,-1);
		OnCommand=cmd(sleep,160.5;diffusealpha,0);
	};
	-- Title artist White back
	LoadActor(THEME:GetPathB("ScreenSelectMusic","underlay/Title_Back")) .. {
		InitCommand=cmd(diffusealpha,0.9;y,22);
		OnCommand=cmd(sleep,160.5;linear,0.25;diffusealpha,0);
	};
	-- Title text
	LoadFont("_russellsquare Bold")..{
		InitCommand=cmd(y,15;zoomy,0.65;zoomx,0.83;diffuse,color("#000000");strokecolor,color("#ffffff");settext,"Dance Dance Revolution");
		OnCommand=cmd(sleep,160.5;diffusealpha,0);	
	};
	-- Artist text
	LoadFont("_russellsquare Bold")..{
		InitCommand=cmd(y,31;zoomy,0.47;zoomx,0.59;diffuse,color("#000000");strokecolor,color("#ffffff");settext,"DDR ALL STARS");
		OnCommand=cmd(sleep,160.5;diffusealpha,0);	
	};
	-- Dancer 1P
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/1PdancerA")) .. {
		InitCommand = cmd(vertalign,bottom;zoom,1.5;diffuse,PlayerColor(PLAYER_1);diffusealpha,0.75;x,-240;y,44;blend,Blend.Add);
		OnCommand=cmd(sleep,160.5;diffusealpha,0);
		Frames = {
			{ Frame = 0; Delay = 0.04; };
			{ Frame = 1; Delay = 0.04; };
			{ Frame = 2; Delay = 0.04; };
			{ Frame = 3; Delay = 0.04; };
			{ Frame = 4; Delay = 0.04; };
			{ Frame = 5; Delay = 0.04; };
			{ Frame = 6; Delay = 0.04; };
			{ Frame = 7; Delay = 0.04; };
			{ Frame = 8; Delay = 0.04; };
			{ Frame = 9; Delay = 0.04; };
			{ Frame = 10; Delay = 0.04; };
			{ Frame = 11; Delay = 0.04; };
			{ Frame = 12; Delay = 0.04; };
			{ Frame = 13; Delay = 0.04; };
			{ Frame = 14; Delay = 0.04; };
			{ Frame = 15; Delay = 0.04; };
			{ Frame = 16; Delay = 0.04; };
			{ Frame = 17; Delay = 0.04; };
			{ Frame = 18; Delay = 0.04; };
			{ Frame = 19; Delay = 0.04; };
			{ Frame = 20; Delay = 0.04; };
			{ Frame = 21; Delay = 0.04; };
			{ Frame = 22; Delay = 0.04; };
			{ Frame = 23; Delay = 0.04; };
		};
	};
	-- Dancer 2P
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/2PdancerA")) .. {
		InitCommand = cmd(vertalign,bottom;zoom,1.5;diffuse,PlayerColor(PLAYER_2);diffusealpha,0.75;x,240;y,43;blend,Blend.Add);
		OnCommand=cmd(sleep,160.5;diffusealpha,0);
		Frames = {
			{ Frame = 0; Delay = 0.04; };
			{ Frame = 1; Delay = 0.04; };
			{ Frame = 2; Delay = 0.04; };
			{ Frame = 3; Delay = 0.04; };
			{ Frame = 4; Delay = 0.04; };
			{ Frame = 5; Delay = 0.04; };
			{ Frame = 6; Delay = 0.04; };
			{ Frame = 7; Delay = 0.04; };
			{ Frame = 8; Delay = 0.04; };
			{ Frame = 9; Delay = 0.04; };
			{ Frame = 10; Delay = 0.04; };
			{ Frame = 11; Delay = 0.04; };
			{ Frame = 12; Delay = 0.04; };
			{ Frame = 13; Delay = 0.04; };
			{ Frame = 14; Delay = 0.04; };
			{ Frame = 15; Delay = 0.04; };
			{ Frame = 16; Delay = 0.04; };
			{ Frame = 17; Delay = 0.04; };
			{ Frame = 18; Delay = 0.04; };
			{ Frame = 19; Delay = 0.04; };
			{ Frame = 20; Delay = 0.04; };
			{ Frame = 21; Delay = 0.04; };
			{ Frame = 22; Delay = 0.04; };
			{ Frame = 23; Delay = 0.04; };
			{ Frame = 24; Delay = 0.04; };
			{ Frame = 25; Delay = 0.04; };
			{ Frame = 26; Delay = 0.04; };
		};
	};
	-- Help text
	LoadFont("Common Normal")..{
		InitCommand=cmd(x,1;y,213+1;zoomx,0.68;zoomy,0.58;diffuse,color("#ffffff");strokecolor,color("#000000");settext,"&MENULEFT;&MENURIGHT;で選択       &START;で決定");
		OnCommand=cmd(sleep,160.5;linear,0.25;diffusealpha,0);	
	};
};