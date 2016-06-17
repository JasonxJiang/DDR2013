return LoadActor("Light") .. {
	GainFocusCommand=cmd(diffusealpha,0.5;zoom,1;visible,true);
	LoseFocusCommand=cmd(visible,false);
};