local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("CharactVersus") .. {
	    InitCommand=cmd(diffusealpha,0;x,-60;y,470;zoom,2;rotationz,180;rotationy,180;fadetop,0.5;croptop,0.5);		
		OnCommand=cmd(zoomy,0;sleep,0.6;linear,0.1;diffusealpha,0.1;zoomy,1.9;linear,0.1;zoomy,2;zoomx,2.2;linear,0.1;zoomx,2);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
	};
};
t[#t+1] = Def.ActorFrame {
   --[[ LoadActor("AllVersus") .. {
	    InitCommand=cmd(diffusealpha,1.0;x,168;y,30;zoom,1.7);
		LoseFocusCommand=cmd(smooth,0.3;diffusealpha,0.2;);
		GainFocusCommand=cmd(smooth,0.3;diffusealpha,1.0;);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
		OnCommand=cmd(diffusealpha,0;smooth,0.3;diffusealpha,1.0;);
	}; ]]--
    LoadActor("PadVersus") .. {
	    InitCommand=cmd(diffusealpha,0;x,0;y,240);
		OnCommand=cmd(sleep,0.5;linear,0.1;diffusealpha,1;zoom,2;linear,0.1;zoom,1.5;linear,0.2;zoom,2);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);		
	};
	LoadActor("PadVersus") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==1;
	    InitCommand=cmd(diffusealpha,0;x,0;y,240);
		OnCommand=cmd(blend,'BlendMode_Add';sleep,0.5;linear,0.1;diffusealpha,0;zoom,2;linear,0.1;zoom,1.5;linear,0.2;zoom,2);
		GainFocusCommand=cmd(stoptweening;zoom,1.98;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.5;diffusealpha,0.5;linear,0.5;diffusealpha,0;queuecommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;zoom,0);
		OffCommand=cmd(stoptweening;smooth,0.1;zoom,0;diffusealpha,0);	
	};
	LoadActor("PadVersus") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==2;
	    InitCommand=cmd(diffusealpha,0;x,0;y,240);
		OnCommand=cmd(blend,'BlendMode_Add';sleep,0.5;linear,0.1;diffusealpha,0;zoom,2;linear,0.1;zoom,1.3;linear,0.2;zoom,2;playcommand,"Animate");
		GainFocusCommand=cmd(stoptweening;zoom,1.98;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.5;diffusealpha,0.5;linear,0.5;diffusealpha,0;queuecommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;zoom,0);
		OffCommand=cmd(stoptweening;smooth,0.1;zoom,0;diffusealpha,0);
	};
};	
----------## Explanations Versus ##----------
---- IF 2 PLAYERS ENABLED -- first choice is versus , explanations appear directly --
t[#t+1] = Def.ActorFrame {	
		LoadActor("ExplVersus") .. {
		Condition=GAMESTATE:GetNumPlayersEnabled()==2;
	    InitCommand=cmd(diffusealpha,0;x,373;y,-150;zoom,2);
		OnCommand=cmd(sleep,0.7;zoomy,0;diffusealpha,0;linear,0.3;diffusealpha,1;zoomy,2);
		GainFocusCommand=cmd(stoptweening;sleep,0.7;linear,0.2;zoomy,2);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoomy,0);
		OffCommand=cmd(linear,0.3;zoom,0;diffusealpha,0;);
	};
---- IF 1 PLAYER ENABLED -- 2nd choice is versus , explanations don't appear directly --	
	    LoadActor("ExplVersus") .. {
		Condition=GAMESTATE:GetNumPlayersEnabled()==1;
	    InitCommand=cmd(diffusealpha,0;x,373;y,-150;zoom,2);
		OnCommand=cmd(sleep,1.2;zoomy,0;diffusealpha,0;linear,0.3;diffusealpha,0;zoomy,2);
		GainFocusCommand=cmd(stoptweening;sleep,1.2;linear,0.2;zoomy,1.98;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoomy,0);
		OffCommand=cmd(linear,0.3;zoom,0;diffusealpha,0;);
	};
};	
----------## Versus sigle Frame ##----------
---- IF 2 PLAYERS ENABLED -- first choice is versus , SigleVersus don't appear directly --
t[#t+1] = Def.ActorFrame {
	LoadActor("SigleVersus") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==2;
	    InitCommand=cmd(x,220;y,-305;zoom,2);
		OnCommand=cmd(diffusealpha,0;linear,0.2;zoomy,2;playcommand,"Animate");
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoomy,0);
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoomy,2;diffusealpha,1;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
		OffCommand=cmd(stoptweening;smooth,0.3;zoom,0;diffusealpha,0;);
	};
---- IF 1 PLAYER ENABLED -- 2nd choice is versus , SigleVersus appear directly --
	LoadActor("SigleVersus") .. {
	    Condition=GAMESTATE:GetNumPlayersEnabled()==1;
	    InitCommand=cmd(x,260;y,-305;zoom,2);
		OnCommand=cmd(diffusealpha,0;linear,0.2;zoomy,2;diffusealpha,1;playcommand,"Animate");
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoomy,0);
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoomy,2;playcommand,"Animate");
		AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
		OffCommand=cmd(stoptweening;smooth,0.3;zoom,0;diffusealpha,0;);
	};
};


t[#t+1] = Def.ActorFrame {
	LoadActor("CharactVersus") .. {
	    InitCommand=cmd(diffusealpha,0;x,-93;y,-110;zoom,2);		
		OnCommand=cmd(zoomy,0;sleep,0.6;linear,0.1;diffusealpha,1;zoomy,2;linear,0.1;zoomy,2;zoomx,1.9;linear,0.1;zoomx,2);
		OffCommand=cmd(smooth,0.3;zoom,0;diffusealpha,0;);
	};
};



return t;