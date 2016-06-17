return Def.ActorFrame {
	LoadActor("Black_Frame_Service") .. {
		InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;);
	};
	LoadActor("focus_Service") .. {
		InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
};