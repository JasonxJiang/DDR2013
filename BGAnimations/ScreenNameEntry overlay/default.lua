local t = Def.ActorFrame {
	-- text
	LoadActor("text") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y),
	};
}
return t