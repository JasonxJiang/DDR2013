return Def.ActorFrame {
	LoadActor("OptionRowExit_Black") .. {
		InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,0;zoomy,1.2);
	};
	LoadActor("OptionRowExit_Focus") .. {
		InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,0;zoomy,1.2);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
};