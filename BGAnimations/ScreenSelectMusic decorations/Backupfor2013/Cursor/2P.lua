return Def.ActorFrame {
	LoadActor( "2c" ) .. {
		InitCommand=cmd(horizalign,right;zoomx,-1);
	};
	Def.Sprite {
		Texture=THEME:GetPathB("ScreenGameplay","overlay/_2P 1x2");
		Frame0000=0;
		Delay0000=0.7;
		Frame0001=1;
		Delay0001=0.3;
		InitCommand=cmd(x,84;effectclock,"beat");
	};
};
	