local t = Def.ActorFrame {
	LoadActor( THEME:GetPathS("", "_MiniMenu") ) .. {
		StartTransitioningCommand=cmd(play);
	};
	Def.Actor { OnCommand=cmd(sleep,0); };
};
return t;
