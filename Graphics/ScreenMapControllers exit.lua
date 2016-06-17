return LoadFont("Common Normal") .. {
	Text=THEME:GetString("ScreenMapControllers","Exit");
	InitCommand=cmd(x,SCREEN_CENTER_X;y,0;zoomx,0.6;zoomy,0.56;diffuse,color("#ffffff");strokecolor,color("#000000"));
	OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
	OffCommand=cmd(accelerate,0.3;addx,SCREEN_WIDTH);
	GainFocusCommand=cmd(zoomx,0.65;zoomy,0.6;diffuse,color("#fff90a"));
	LoseFocusCommand=cmd(zoomx,0.6;zoomy,0.56;diffuse,color("#ffffff"));
};
