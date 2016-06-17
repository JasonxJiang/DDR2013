return Def.ActorFrame {
	LoadActor(THEME:GetPathB('','_frame 3x1'), 'ScreenEvaluation_ScoreLabel', WideScale(580,616)) .. {
	};
	LoadFont("_serpentinedbol 19px") .. {
		InitCommand=cmd(zoomx,0.9;zoomy,0.84;diffuse,color("#ffffff"));
		OnCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
				self:settext("TOTAL");
			else
				self:settext("SCORE");
			end;
		end;
	};
};