return LoadActor("Light") .. {
	GainFocusCommand=cmd(diffusealpha,0.5;visible,true);
	LoseFocusCommand=cmd(visible,false);
};