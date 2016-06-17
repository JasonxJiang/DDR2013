local t = Def.ActorFrame {

	--全体に影を落とす黒
	Def.Quad{
		InitCommand=cmd(diffuse,color("0,0,0,1");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
		OnCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,0.75);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};

}

return t