local t = Def.ActorFrame {};

t[#t+1] = LoadActor("ScreenOptions header") .. {
	InitCommand=cmd(y,SCREEN_TOP+45);
};

t[#t+1] = LoadFont( "_futura std medium 20px" ) .. {
	Name="HeaderSubText";
	Text=Screen.String("HeaderSubText");
	InitCommand=cmd(x,0-320;y,SCREEN_TOP+60;diffuse,color("#fff90a");strokecolor,color("#000000");zoomx,1;zoomy,1);
	OnCommand=cmd(cropright,1;linear,0.25;cropright,0);
	OffCommand=cmd(cropright,0;linear,0.25;cropright,1);
};

return t