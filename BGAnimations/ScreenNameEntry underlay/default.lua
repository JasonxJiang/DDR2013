local t = Def.ActorFrame {
	-- Black back	
	Def.Quad{
		InitCommand=cmd(diffuse,color("#000000");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
	};
	-- Congratulations text
	LoadActor("Congratulations") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.44;diffusealpha,0),
		OnCommand=cmd(linear,1;diffusealpha,1),
	};
}
return t