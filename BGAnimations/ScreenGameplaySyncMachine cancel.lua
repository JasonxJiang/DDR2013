return Def.ActorFrame {
	Def.Actor {
		OnCommand=function(self)
			self:sleep(1);
		end;
	};
	LoadActor(THEME:GetPathS("Common","cancel")) .. {
		StartTransitioningCommand=function(self)
			self:play();
		end;
	};
	Def.Quad {
		InitCommand=function(self)
			self:Center();
			self:diffuse(color("#000000"));
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT);
		end;
		StartTransitioningCommand=function(self)
			self:diffusealpha(0);
			self:linear(0.3);
			self:diffusealpha(1);
		end;
	};
};