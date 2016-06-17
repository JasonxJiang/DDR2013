local t = Def.ActorFrame {};
--- FRAME SINGLE ---
t[#t+1] = Def.ActorFrame {
    LoadActor("FrameSingle") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==1;
	    InitCommand=cmd();
		OnCommand=cmd();
		GainFocusCommand=cmd(stoptweening;);
		LoseFocusCommand=cmd(stoptweening;);
		OffCommand=cmd();
	};
	LoadActor("FrameSingle") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==2;
	    InitCommand=cmd();
		OnCommand=cmd();
		GainFocusCommand=cmd(stoptweening;);
		LoseFocusCommand=cmd(stoptweening;);
		OffCommand=cmd();
    };
};	
return t;
