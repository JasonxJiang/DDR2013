local gc = Var("GameCommand");
local t = Def.ActorFrame {};





t[#t+1] = Def.ActorFrame { 
  GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","InfoGainFocusCommand");
  LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","InfoLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectInfo",gc:GetName() )) .. {
		DisabledCommand=cmd(diffuse,color("0.0,0.0,0.0,0"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		
		OnCommand=cmd(x,-290;y,-40;zoomy,0;decelerate,0.35;zoomy,1);
		OffCommand=cmd(linear,0.1175;zoomy,0);
	};
};


t[#t+1] = Def.ActorFrame { 
  GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","SmallInfoGainFocusCommand");
  LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","SmallInfoLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectSmallInfo",gc:GetName() )) .. {
		DisabledCommand=cmd(diffuse,color("0.2,0.2,0.2,1"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		
		OnCommand=cmd();
		OffCommand=cmd();
	};
};


t[#t+1] = Def.ActorFrame { 
  GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconGainFocusCommand");
  LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() )) .. {
		DisabledCommand=cmd(diffuse,color("0.0,0.0,0.0,0"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		OnCommand=cmd(zoom,0;decelerate,0.35;zoom,1;);
		OffCommand=cmd(linear,0.1175;zoomx,0);
	};
};


return t