return Def.ActorFrame {
	LoadActor("OptionRowServiceChild_Black") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+220;zoomy,1.3;zoomx,1.33);
	};
	LoadActor("OptionRowServiceChild_Focus") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+220;zoomy,1.3;zoomx,1.33);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
};