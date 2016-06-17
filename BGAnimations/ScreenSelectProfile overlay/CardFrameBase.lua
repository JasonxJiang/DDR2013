return Def.ActorFrame {
	LoadActor("Back") .. {
		InitCommand=cmd(diffusealpha,0.75;scaletoclipped,374,526);
	};
	LoadActor("Bar") .. {
		InitCommand=cmd(y,-255;scaletoclipped,380,34);
	};
	LoadActor("Bar") .. {
		InitCommand=cmd(y,255;scaletoclipped,380,34);
	};
};