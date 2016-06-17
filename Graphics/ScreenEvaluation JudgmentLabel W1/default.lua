local jl = Var "JudgmentLine";

return Def.ActorFrame {	
	LoadActor("Judgment_Frame") .. {
		InitCommand=cmd();
	};
	LoadFont("_serpentinedbol 19px") .. {
		InitCommand=cmd(zoomx,0.85;zoomy,0.8;settext,string.upper(JudgmentLineToLocalizedString(jl));diffuse,JudgmentLineToColor(jl);strokecolor,JudgmentLineToStrokeColor(jl));
	};
};