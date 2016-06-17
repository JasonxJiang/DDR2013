local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("CharactSingle") .. {
	    InitCommand=cmd(diffusealpha,1.0;x,SCREEN_CENTER_X-300;zoom,2);
		LoseFocusCommand=cmd(smooth,0.3;diffusealpha,0.2;);
		GainFocusCommand=cmd(smooth,0.3;diffusealpha,1.0;);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
		OnCommand=cmd(diffusealpha,0;smooth,0.3;diffusealpha,1.0;);
	};

};


t[#t+1] = Def.ActorFrame {
	LoadFont("Common normal") .. { 
			InitCommand=cmd(diffusealpha,0;y,-50;diffuse,color("#000000"););
			LoseFocusCommand=cmd(smooth,0.2;diffusealpha,0;zoomy,0;);
			GainFocusCommand=cmd(smooth,0.2;diffusealpha,1.0;zoomy,1);
			OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
			Text="";
	};
};

return t;