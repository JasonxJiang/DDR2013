local t = Def.ActorFrame {

	--全体に影を落とすための黒
	Def.Quad{
		InitCommand=cmd(diffuse,color("0,0,0,1");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
		OnCommand=cmd(diffusealpha,0.4;linear,0.25;diffusealpha,0.8;),
		OffCommand=cmd(linear,0.25;diffusealpha,0),
	};
	
	LoadActor("ScreenEditOptions_page") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y),
		OnCommand=cmd(diffusealpha,1;addx,-SCREEN_WIDTH;sleep,0.25;decelerate,0.25;addx,SCREEN_WIDTH),
		OffCommand=cmd(accelerate,0.25;addx,SCREEN_WIDTH;linear,0;diffusealpha,0;addx,-SCREEN_WIDTH;),
	};
	
}

return t
