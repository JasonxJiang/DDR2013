local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,1"));
	};
};
t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		LoadActor("intro.avi") .. {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			OnCommand=cmd(play);
		};
	};
};

return t