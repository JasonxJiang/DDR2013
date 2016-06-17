return Def.ActorFrame {
    Def.Quad {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffuse,color("#000000ff");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
		OnCommand=cmd(linear,0.25;diffuse,color("#000000");diffusealpha,0.7);
	};
	LoadActor("1pExpl") .. {
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X;y,380);
		OnCommand=cmd();
		OffCommand=cmd(linear,0.25;addx,600);
	};
	LoadActor("2pExpl") .. {
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X;y,380);
		OnCommand=cmd();
		OffCommand=cmd(linear,0.25;addx,600);
	};
}