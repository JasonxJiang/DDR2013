local t = Def.ActorFrame {
	LoadActor("particle") .. {
		InitCommand=cmd(blend,"BlendMode_Add";x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;stretchto,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM),
		OnCommand=cmd(diffusealpha,0;sleep,9;diffusealpha,1;setstate,0;sleep,1.5;diffusealpha,0),
	};
}
return t