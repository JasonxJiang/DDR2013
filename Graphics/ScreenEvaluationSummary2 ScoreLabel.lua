return Def.ActorFrame {
	LoadActor(THEME:GetPathB('','_frame 3x1'), 'ScreenEvaluation_ScoreLabel', WideScale(580,616)) .. {
	};
	LoadFont( "_serpentinedbol 19px" ) .. {
		Text="TOTAL SCORE";
		InitCommand=cmd(zoomx,0.85;zoomy,0.8;diffuse,color("#ffffff"));
	};
};