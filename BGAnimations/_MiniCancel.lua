local t = Def.ActorFrame {
	LoadActor(THEME:GetPathS("Common","cancel")) .. {
		StartTransitioningCommand=cmd(play);
	};
	Def.Actor { OnCommand=cmd(sleep,0); };
};
return t;
